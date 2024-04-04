/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import (
	"github.com/HeavenZhi/what-eat/common-service/pkg/model"
	"github.com/google/uuid"
)

// 菜谱详情和食材对应表
type CookbookIngredient struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱和食材对照表唯一键
	Sid uuid.UUID
	//食材用量
	Quantity string
	//cookbook表的sid外键
	CSid uuid.UUID
	//Ingredient模块的ingredient表的sid外键
	ISid uuid.UUID
}
