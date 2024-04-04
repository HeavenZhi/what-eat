/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import "time"

// BaseModel 基础模型
type BaseModel struct {
	ID       uint `gorm:"primaryKey"`
	CreateAt time.Time
	UpdateAt time.Time
	CreateBy string
	UpdateBy string
	Version  int16
	IsDel    int8 `gorm:"index"`
}
