/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 菜系分类表
type Cuisine struct {
	model.BaseModel //嵌入基本默认模型

	//菜系分类表唯一键
	Sid int64
	//菜系名称
	Name string
	//菜系描述
	Description string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (Cuisine) TableName() string {
	return "cuisine"
}
