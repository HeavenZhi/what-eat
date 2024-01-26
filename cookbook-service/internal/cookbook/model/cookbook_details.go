/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import "github.com/HeavenZhi/what-eat/cookbook-service/internal/common/model"

// 菜谱详情表
type CookbookDetails struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱详情表唯一键
	Sid int64
	//cookbook表的sid外键
	CSid int64
	//该菜品特色
	Feature string
	//具体烹饪方法总览
	CookingMethods string
}

// TableName 重写表名，实现 gorm 接口方法
func (CookbookDetails) TableName() string {
	return "cookbook_details"
}
