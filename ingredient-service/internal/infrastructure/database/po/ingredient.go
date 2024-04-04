/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package po

import "github.com/HeavenZhi/what-eat/common-service/pkg/model"

// 食材表
type Ingredient struct {
	model.BaseModel //嵌入基本默认模型

	//食材表唯一键
	Sid string
	//食材名称
	Name string
	//食材图片地址
	ImageAddress string
	//上级id
	Fid int64
	//ingredient_kind表的sid外键
	IkSid string
	//ingredient_type表的sid外键
	ItSid string
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
}

// TableName 重写表名，指定结构体对数据库表的映射，实现 gorm 接口方法
func (Ingredient) TableName() string {
	return "ingredient"
}
