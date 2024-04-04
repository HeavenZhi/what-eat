/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package registry

import (
	"fmt"

	"github.com/hashicorp/consul/api"
)

// ConsulRegistry 定义一个ConsulRegistry结构体，其内部有一个`*api.Client`字段。
type ConsulRegistry struct {
	client *api.Client
}

/*
InitRegistry 连接至 consul 服务，初始化全局的 consul 对象

	这段代码的目的是在 Go 语言中连接到 Consul 服务并初始化一个全局的 Consul 对象，以便后续可以使用该对象来进行服务发现、健康检查等操作。
	整体来说，它涵盖了配置对象的创建、客户端的初始化以及错误处理等方面的内容。
*/
func NewConsulRegistry(addr string) (*ConsulRegistry, error) {
	//api.DefaultConfig返回一个默认的 Consul 配置对象
	cfg := api.DefaultConfig()

	//这一行代码将之前创建的配置对象的 Address 字段设置为传入的 addr 参数的值。Address 字段表示要连接的 Consul 服务的地址，通过这个步骤，我们告诉配置对象要连接的具体地址。
	cfg.Address = addr

	/*
		在这一行代码中，使用之前配置好的配置对象 cfg 来创建一个新的 Consul 客户端对象 c
			api.NewClient() 函数接受一个配置对象作为参数，并返回一个连接到 Consul 的客户端对象，
		一个连接到 Consul 的客户端对象在应用程序中扮演着与 Consul 交互的角色
			Consul 是一种用于服务发现、配置管理和健康检查的分布式系统，连接到 Consul 的客户端对象允许你的应用程序与 Consul 服务进行通信
	*/
	client, err := api.NewClient(cfg)
	if err != nil {
		//如果创建客户端对象的过程中发生错误，返回错误信息
		return nil, err
	}

	//创建 ConsulRegistry 对象
	consulRegistry := &ConsulRegistry{client}

	//将创建好的客户端对象存储在全局变量中，以便其他地方可以使用
	Reg = consulRegistry

	//返回 nil 表示初始化成功
	return consulRegistry, nil
}

// RegisterService 将gRPC服务注册到consul
func (c *ConsulRegistry) RegisterService(serviceName string, ip string, port int, tags []string) (err error) {
	// agent 客户端代理
	agent := c.client.Agent()

	// 健康检查，Timeout 表示检查超时时间，Interval 表示检查的间隔时间，DeregisterCriticalServiceAfter 表示如果服务在指定时间内没有通过健康检查，将会从 Consul 注销。
	check := &api.AgentServiceCheck{
		GRPC:                           fmt.Sprintf("%s:%d", ip, port), // 这里一定是外部可以访问的地址
		Timeout:                        "10s",
		Interval:                       "10s",
		DeregisterCriticalServiceAfter: "20s",
	}
	/*
		在这一段代码中，一个服务注册对象 srv 被创建。这个对象包含了要注册到 Consul 的服务的详细信息。
		ID 字段用于标识唯一的服务，根据服务名、IP 地址和端口号生成。Name 字段设置为服务的名称，
		Tags 字段是一个字符串切片，可以为服务添加标签，例如标识服务的用途或特性。Address 和 Port 字段分别设置为
		服务的 IP 地址和端口号。Check 字段使用之前创建的健康检查对象。
	*/
	srv := &api.AgentServiceRegistration{
		ID:      fmt.Sprintf("%s-%s-%d", serviceName, ip, port), // 服务唯一ID
		Name:    serviceName,                                    // 服务名称
		Tags:    tags,                                           // 为服务打标签
		Address: ip,
		Port:    port,
		Check:   check,
	}
	//调用 Consul 客户端的 Agent().ServiceRegister() 方法来将之前创建的服务注册对象 srv 注册到 Consul。
	return agent.ServiceRegister(srv)
}

// ListService 服务发现
func (c *ConsulRegistry) ListService(serviceName string) (mapRegiser map[string]any, err error) {
	// agent 客户端代理
	agent := c.client.Agent()

	// 使用agent的ServicesWithFilter方法，传入一个格式化的字符串， filtering the list of services based on the given service name
	// 过滤出包含给定服务名的服务列表，并将其存储在mapConsul中
	mapConsul, err := agent.ServicesWithFilter(fmt.Sprintf("Service==`%s`", serviceName))

	// 创建一个空的 mapRegiser，用于存储转换为接口类型的服务列表
	mapRegiser = make(map[string]any)

	// 遍历mapConsul，将转换后的服务列表存储在 mapRegiser 中
	for k, v := range mapConsul {
		mapRegiser[k] = v
	}

	//返回结果
	return mapRegiser, err
}

// Deregister 注销服务
func (c *ConsulRegistry) Deregister(serviceID string) (err error) {
	// agent 客户端代理
	agent := c.client.Agent()

	// 调用agent客户端代理的ServiceDeregister方法，传入serviceID参数，返回 err
	return agent.ServiceDeregister(serviceID)
}
