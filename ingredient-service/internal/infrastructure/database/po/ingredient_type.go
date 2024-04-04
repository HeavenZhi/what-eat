/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 食材类型表
type IngredientType struct {
	model.BaseModel //嵌入基本默认模型

	//食材类型表唯一键
	Sid string
	//食材类型名称
	Name string
	//ingredient_kind表的sid外键
	IkSid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (IngredientType) TableName() string {
	return "ingredient_type"
}
