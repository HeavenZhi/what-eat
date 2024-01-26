/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import "github.com/HeavenZhi/what-eat/cookbook-service/internal/common/model"

// 菜谱详情和食材对应表
type CookbookDetailsIngredient struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱和食材对照表唯一键
	Sid int64
	//食材用量
	Quantity string
	//cookbook_details表的sid外键
	CdSid int64
	//ingredient表的sid外键
	ISid int64
}

// TableName 重写表名，实现 gorm 接口方法
func (CookbookDetailsIngredient) TableName() string {
	return "cookbook_details_ingredient"
}
