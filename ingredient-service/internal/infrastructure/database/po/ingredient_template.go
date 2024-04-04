/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 食材模板表
type IngredientTemplate struct {
	model.BaseModel //嵌入基本默认模型

	//食材模板表唯一键
	Sid string
	//食材名
	Name string
	//食材模板图片地址
	ImageAddress string
	//上级分类id
	Fid string
	//顶级分类id
	Tid string
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
	//ingredient_kind表的sid外键
	IkSid string
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (IngredientTemplate) TableName() string {
	return "ingredient_template"
}
