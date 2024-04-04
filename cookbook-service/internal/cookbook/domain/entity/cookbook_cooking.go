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

// 菜谱详情和操作流程对应表
type CookbookCooking struct {
	model.BaseModel //嵌入基本默认模型

	//菜品详情和操作流程对应表唯一键
	Sid uuid.UUID
	//菜谱制作步骤图片地址
	ImageAddress string
	//食材处理描述
	Description string
	//cookbook表的sid外键
	CSid uuid.UUID
	//cooking_health表的sid外键
	ChSid uuid.UUID
}
