/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 烹饪难度和健康程度打分表
type CookingHealth struct {
	model.BaseModel //嵌入基本默认模型

	//烹饪难度和健康程度打分表唯一键
	Sid string
	//烹饪方法
	Name string
	//加分的分值,加分越多代表操作越复杂,加分越少代表操作越简单
	ProcessDifficulty float32
	//加分的分值,加分越多代表过程越不清淡,加分越少代表过程越清淡
	Health float32
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (CookingHealth) TableName() string {
	return "cooking_health"
}
