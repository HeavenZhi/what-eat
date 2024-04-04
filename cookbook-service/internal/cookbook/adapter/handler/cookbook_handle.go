package handler

import (
	"context"

	pb "github.com/HeavenZhi/what-eat/cookbook-service/api/cookbook"
	"github.com/HeavenZhi/what-eat/cookbook-service/internal/cookbook/application"
	"google.golang.org/protobuf/types/known/emptypb"
)

// CookbookSrv 结构体代表了菜谱服务的具体实现，它遵循 protobuf 编写的 CookbookServer 接口规范。
// 它主要用于处理与菜谱相关的服务请求，并通过应用层接口与业务逻辑进行交互。
type CookbookSrv struct {
	// pb.UnimplementedCookbookServer 表示实现了 protobuf 定义的 CookbookServer 接口，
	// 但默认情况下不提供任何具体实现，需要在本结构体中自定义方法来覆盖默认行为。
	pb.UnimplementedCookbookServer

	// cookbookApp 是指向 application.CookbookApplicationer 接口类型的一个字段，代表了应用层的接口。
	// 通过这个字段，CookbookSrv 可以调用应用层提供的方法来执行与菜谱相关的具体业务操作。
	cookbookApp application.CookbookApplicationer
}

// NewCookbookSrv 是一个工厂函数，用于创建一个新的 CookbookSrv 实例。
// 它接收一个实现了 application.CookbookApplicationer 接口的对象作为参数，
// 并将该对象与新建的 CookbookSrv 结构体关联起来，以便在处理菜谱服务请求时调用其方法执行业务逻辑。

func NewCookbookSrv(cookbookApp application.CookbookApplicationer) *CookbookSrv {
	// 创建并初始化CookbookSrv结构体实例
	srv := &CookbookSrv{
		// 将传入的应用层接口赋值给结构体内的 cookbookApp 字段
		cookbookApp: cookbookApp,
	}
	// 返回新创建的CookbookSrv实例
	return srv
}

// 新增菜谱
func (c *CookbookSrv) InsertCookbook(context.Context, *pb.CookbookRequest) (*pb.BooleanResponse, error) {
	return nil, nil
}

// 删除菜谱
func (c *CookbookSrv) DeleteCookbook(context.Context, *pb.CookbookBySidRequest) (*pb.BooleanResponse, error) {
	return nil, nil
}

// 修改菜谱
func (c *CookbookSrv) UpdateCookbook(context.Context, *pb.CookbookRequest) (*pb.BooleanResponse, error) {
	return nil, nil
}

// 根据菜谱的Sid查找菜谱
func (c *CookbookSrv) GetCookbookBySid(context.Context, *pb.CookbookBySidRequest) (*pb.GetCookbookResponse, error) {
	return nil, nil
}

// 根据菜谱表的 name 批量获取菜谱列表
func (c *CookbookSrv) FindCookbookListByName(context.Context, *pb.CookbookListByNameRequest) (*pb.FindCookbookListResponse, error) {
	return nil, nil
}

// 根据 cuisine 表的 sid 批量获取菜谱列表
func (c *CookbookSrv) FindCookbookListByCuisineSid(context.Context, *pb.CookbookListByCuisineSidRequest) (*pb.FindCookbookListResponse, error) {
	return nil, nil
}

// 根据 dishes_type 表的 sid 批量获取菜谱列表
func (c *CookbookSrv) FindCookbookListByDtSid(context.Context, *pb.CookbookListByDtSidRequest) (*pb.FindCookbookListResponse, error) {
	return nil, nil
}

// 根据综合条件批量获取菜谱列表的请求体
func (c *CookbookSrv) FindCookbookListByGeneralConditions(context.Context, *pb.CookbookListByGeneralConditionsRequest) (*pb.FindCookbookListResponse, error) {
	return nil, nil
}

// 批量获取菜谱列表
func (c *CookbookSrv) FindCookbookList(context.Context, *emptypb.Empty) (*pb.FindCookbookListResponse, error) {

	return nil, nil
}
