/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import "github.com/HeavenZhi/what-eat/cookbook-service/internal/common/model"

// 菜谱详情和操作流程对应表
type CookbookDetailsCooking struct {
	model.BaseModel //嵌入基本默认模型

	//菜品详情和操作流程对应表唯一键
	Sid int64
	//食材处理描述
	Description string
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
	//cookbook_details表的sid外键
	CdSid int64
	//cooking_health表的sid外键
	ChSid int64
}

// TableName 重写表名，实现 gorm 接口方法
func (CookbookDetailsCooking) TableName() string {
	return "cookbook_details_cooking"
}
