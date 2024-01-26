/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import "github.com/HeavenZhi/what-eat/cookbook-service/internal/common/model"

// 菜谱大全
type Cookbook struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱唯一键
	Sid int64
	//菜名
	Name string
	//荤素,荤为1,素为0
	Raptatorial int8
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
	//cuisine表的sid外键
	CuisineSid int64
	//dishes_type表的sid外键
	DtSid int64
}

// TableName 重写表名，实现 gorm 接口方法
func (Cookbook) TableName() string {
	return "cookbook"
}
