/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package registry

//使用接口操作服务注册与发现

/*
面向接口开发的核心：我不关心对方是什么（类型是什么），我只关心对方能做什么（方法）
抽象做的好，后期可以很方便的切换不同的注册中心
*/

// 服务注册的接口对象
var Reg Regiser

// Regiser 服务注册与服务发现的接口
type Regiser interface {
	// RegisterService 服务注册
	RegisterService(serviceName string, ip string, port int, tags []string) (err error)
	// ListService 服务发现
	ListService(serviceName string) (mapRegiser map[string]any, err error)
	// Deregister 服务注销
	Deregister(serviceID string) (err error)
}
