/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 菜谱表
type Cookbook struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱表唯一键
	Sid string
	//菜名
	Name string
	//菜谱图片地址
	ImageAddress string
	//是否为荤菜
	IsMeat bool
	//该菜品特色
	Feature string
	//具体烹饪方法总览
	CookingMethods string
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
	//cuisine表的sid外键
	CuisineSid string
	//dishes_type表的sid外键
	DtSid string
	//User模块的user表的sid外键
	UserSid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (Cookbook) TableName() string {
	return "cookbook"
}
