/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package main

import (
	"context"
	"flag"
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"

	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/config"
	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/database"
	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/logger"
	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/registry"
	pb "github.com/HeavenZhi/what-eat/cookbook-service/api/cookbook"
	"github.com/HeavenZhi/what-eat/cookbook-service/internal/cookbook/adapter/handler"

	"go.uber.org/zap"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

var (
	// cfg 配置文件模块接口
	cfg config.Configer
	// logs 日志模块接口
	logs logger.Logger
	// db 数据库模块接口
	db database.DataBaser
	// register 注册模块接口
	register registry.Regiser
)

// 主函数
func main() {
	/*-----------------------------------------------------初始化各个基础模块-----------------------------------------------------*/
	//用于接收终端传入的参数
	var cfn string
	/*
		从命令行获取可能的conf路径（flag名, 默认值, 帮助信息）
			例如：cookbook-service -conf "./conf/config.toml"
	*/
	flag.StringVar(&cfn, "conf", "./conf/config.toml", "指定项目的配置文件路径")
	//解析命令行参数
	flag.Parse()

	//0.加载配置文件
	cfg = config.NewViperConfig(cfn)
	err := cfg.InitConfig()
	if err != nil {
		//程序启动时加载配置文件失败直接退出
		panic(err)
	}

	//1.使用配置文件来初始日志模块
	logs = logger.NewZapLog(config.Conf.LogConfig)
	err = logs.InitLog()
	if err != nil {
		//程序启动时初始化日志模块失败直接退出
		panic(err)
	}
	logger.Log.Info("[Init Log]: Init logger success.")

	//2.使用配置文件来初始 MySQL 模块
	db = database.NewMySQLDataBase(config.Conf.MySQLConfig)
	err = db.InitDataBaseConnect()
	if err != nil {
		//程序启动时初始化 MySQL 模块失败直接退出
		panic(err)
	}
	logger.Log.Info("[Init DataBase Connect]: Init DataBase connect success.")

	//3.使用配置文件来初始化服务注册与发现中心
	register, err = registry.NewConsulRegistry(config.Conf.ConsulConfig.Addr)
	if err != nil {
		//程序启动时初始化 MySQL 模块失败直接退出
		panic(err)
	}

	logger.Log.Info("[Init Registry]: Init Registry success.")

	/*-----------------------------------------------------启动 gRPC 的 RPC 服务-----------------------------------------------------*/

	/*
		启动监听
			创建一个监听器，用于接收客户端的连接请求，net.Listen 函数会返回一个 *net.Listener 类型的指针
				net.Listen 函数接受两个参数：一个是网络类型（这里使用的是 "tcp"），另一个是监听地址(这里使用的是“本机的 8002 端口”)
			当客户端向 gRPC 服务器发起连接请求时，监听器会接收到请求，并将其传递给 gRPC 服务器
	*/
	listener, err := net.Listen("tcp", fmt.Sprintf("%s:%d", config.Conf.IP, config.Conf.Port))
	if err != nil {
		logger.Log.Error("[Error Cookbook-Service gRPC Server]: Cookbook-Service grpc server listen port error: ", zap.Error(err))
	}

	//创建 gRPC 服务器
	rpcServer := grpc.NewServer()

	/*
		注册自定义服务到 gRPC 服务器
			将 CookbookServer 注册到服务器 rpcServer 中，使得 CookbookServer 成为 gRPC 服务的一部分
			这样当客户端向 gRPC 服务器发起请求时，CookbookServer 中的方法就可以被调用了
	*/
	pb.RegisterCookbookServer(rpcServer, &handler.CookbookSrv{})

	/*
		启动 gRPC 服务器
			启动 gRPC 服务器，使其开始监听客户端的连接请求，并处理客户端发来的请求
			rpcServer.Serve(listener) 函数接受一个参数 listener，表示监听器，然后让 gRPC 服务器开始监听 listener 接收到的连接请求，并处理请求
			如果启动监听器时发生错误，Serve 函数会返回一个错误信息，此时会调用 log.Fatalln 函数，输出错误信息并退出程序
	*/
	go func() {
		logger.Log.Info("[Cookbook-Service gRPC Server]: Cookbook-Service offers RPC services on http://" + fmt.Sprintf("%s:%d", config.Conf.IP, config.Conf.Port))

		err = rpcServer.Serve(listener)
		if err != nil {
			logger.Log.Error("[Error Cookbook-Service gRPC Server]: ", zap.Error(err))
		}
	}()

	// 将自定义的 gRPC 服务注册到 Consul
	register.RegisterService(config.Conf.Name, config.Conf.IP, config.Conf.Port, nil)

	logger.Log.Info("[Cookbook-Service gRPC Server]: Cookbook-Service gRPC Server register success on the Consul: http://" + fmt.Sprintf("%s:%d", config.Conf.IP, 8500))

	/*-----------------------------------------------------启动 gRPC-Gateway 的 HTTP 服务-----------------------------------------------------*/

	// 创建 gRPC 客户端连接到刚刚启动的 gRPC 服务器
	conn, err := grpc.DialContext(
		context.Background(),
		fmt.Sprintf("%s:%d", config.Conf.IP, config.Conf.Port),
		grpc.WithBlock(), // 阻塞直到连接建立完成
		grpc.WithTransportCredentials(insecure.NewCredentials()), // 使用不安全的凭据进行连接
	)
	if err != nil {
		// 若连接失败，则输出错误信息并终止程序
		logger.Log.Error("[Error Cookbook-Service gRPC-Gateway's HTTP Server]: Failed to dial Cookbook-Service gRPC Server: ", zap.Error(err))
	}

	// 创建一个 gRPC-Gateway 的反向代理路由
	gwmux := runtime.NewServeMux()

	// 将 Cookbook 服务注册到 gRPC-Gateway 路由处理器 mux 上，以便将 HTTP 请求转换为 gRPC 调用
	err = pb.RegisterCookbookHandler(context.Background(), gwmux, conn)
	if err != nil {
		// 注册失败时输出错误信息并终止程序
		logger.Log.Error("[Error Cookbook-Service gRPC-Gateway's HTTP Server]: Failed to register Cookbook-Service gRPC-Gateway's HTTP Server: ", zap.Error(err))
	}

	// 创建一个新的 HTTP 服务器实例，使用 gRPC-Gateway 的 mux 作为处理器
	gwServer := &http.Server{
		Addr:    ":8090",
		Handler: gwmux,
	}

	// 输出日志，表明 gRPC-Gateway 服务将在 0.0.0.0:8090 端口提供 HTTP 服务
	logger.Log.Info("[Cookbook-Service gRPC-Gateway's HTTP Server]: Cookbook-Service offers HTTP services on http://" + fmt.Sprintf("%s:%d", config.Conf.IP, 8090))

	// 启动 HTTP 服务器，监听 8090 端口并在遇到错误时终止程序
	err = gwServer.ListenAndServe()
	if err != nil {
		// 若启动 HTTP 服务器时发生错误，则输出错误信息并终止程序
		logger.Log.Error("[Error Cookbook-Service gRPC-Gateway's HTTP Server]: ", zap.Error(err))
	}

	/*-----------------------------------------------------gRPC 服务退出时，要注销 Consul 中注册的服务-----------------------------------------------------*/

	//定义一个通道
	quit := make(chan os.Signal, 1)
	//当操作系统发出 Ctrl+C 或者 kill 操作时，会向 quit 通道中发送信号
	signal.Notify(quit, syscall.SIGTERM, syscall.SIGINT)
	//正常情况下会阻塞在此处，当通道有值后，会继续往下运行
	<-quit

	/* 服务退出时，要 在 Consul 注销之前在 Consul 注册的服务 */

	// 组合服务的 ID 为：服务名-IP-端口
	serviceId := fmt.Sprintf("%s-%s-%d", config.Conf.Name, config.Conf.IP, config.Conf.Port)
	// 在 Consul 中注销服务
	register.Deregister(serviceId)
}
