/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 菜谱详情和操作流程对应表
type CookbookCooking struct {
	model.BaseModel //嵌入基本默认模型

	//菜品详情和操作流程对应表唯一键
	Sid string
	//菜谱制作步骤图片地址
	ImageAddress string
	//食材处理描述
	Description string
	//cookbook表的sid外键
	CSid string
	//cooking_health表的sid外键
	ChSid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (CookbookCooking) TableName() string {
	return "cookbook_cooking"
}
