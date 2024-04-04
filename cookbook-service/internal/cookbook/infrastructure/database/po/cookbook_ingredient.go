/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 菜谱详情和食材对应表
type CookbookIngredient struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱和食材对照表唯一键
	Sid string
	//食材用量
	Quantity string
	//cookbook表的sid外键
	CSid string
	//Ingredient模块的ingredient表的sid外键
	ISid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (CookbookIngredient) TableName() string {
	return "cookbook_ingredient"
}
