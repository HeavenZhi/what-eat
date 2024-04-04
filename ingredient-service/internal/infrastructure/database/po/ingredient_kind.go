/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 食材类别表
type IngredientKind struct {
	model.BaseModel //嵌入基本默认模型

	//食材类别表唯一键
	Sid string
	//类别名
	Name string
	//类别描述
	Description string
	//上级分类id
	Fid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (IngredientKind) TableName() string {
	return "ingredient_kind"
}
