/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package model

import (
	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/logger"
	"github.com/HeavenZhi/what-eat/common-service/pkg/model"
	"github.com/HeavenZhi/what-eat/cookbook-service/internal/cookbook/infrastructure/errno"
	"github.com/google/uuid"
	"go.uber.org/zap"
)

// 菜谱表
type Cookbook struct {
	model.BaseModel //嵌入基本默认模型

	//菜谱表唯一键
	Sid uuid.UUID
	//菜名
	Name string
	//菜谱图片地址
	ImageAddress string
	//是否为荤菜
	IsMeat bool
	//该菜品特色
	Feature string
	//具体烹饪方法总览
	CookingMethods string
	//食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单
	ProcessDifficulty float32
	//食材的清淡程度分值,加分越多越重口味,加分越少越清淡
	Health float32
	//cuisine表的sid外键
	CuisineSid uuid.UUID
	//dishes_type表的sid外键
	DtSid uuid.UUID
	//User模块的user表的sid外键
	UserSid uuid.UUID
}

// 新建菜谱
func NewCookbook(name, ImageAddress string, IsMeat bool, Feature, CookingMethods string, ProcessDifficulty, Health float32, cuisineSid, dtSid, userSid uuid.UUID) (*Cookbook, error) {
	// 判断菜名是否为空
	if name == "" {
		logger.Log.Error("", zap.Error(errno.ErrorCookbookNameEmpty))
		return nil, errno.ErrorCookbookNameEmpty
	}

	// 判断 cuisine 表的 sid 是否为空
	if len(cuisineSid) == 0 {
		logger.Log.Error("", zap.Error(errno.ErrorCookbookCuisineSidEmpty))
		return nil, errno.ErrorCookbookCuisineSidEmpty
	}

	// 判断 dishes_type 表的 sid 是否为空
	if len(dtSid) == 0 {
		logger.Log.Error("", zap.Error(errno.ErrorCookbookDtSidEmpty))
		return nil, errno.ErrorCookbookDtSidEmpty
	}

	// 判断 user 表的 sid 是否为空
	if len(userSid) == 0 {
		logger.Log.Error("", zap.Error(errno.ErrorCookbookUserSidEmpty))
		return nil, errno.ErrorCookbookUserSidEmpty
	}

	return &Cookbook{
		Sid:               uuid.New(),
		Name:              name,
		ImageAddress:      ImageAddress,
		IsMeat:            IsMeat,
		Feature:           Feature,
		CookingMethods:    CookingMethods,
		ProcessDifficulty: ProcessDifficulty,
		Health:            Health,
		CuisineSid:        cuisineSid,
		DtSid:             dtSid,
		UserSid:           userSid,
	}, nil
}

