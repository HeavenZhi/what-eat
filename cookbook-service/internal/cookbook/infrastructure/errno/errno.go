/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package errno

import (
	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/errno"
)

var (
	// Cookbook name 为空
	ErrorCookbookNameEmpty = errno.Errno{Code: "Error New Cookbook", Message: "New Cookbook's Name is empty."}
	// Cookbook cuisineSid 为空
	ErrorCookbookCuisineSidEmpty = errno.Errno{Code: "Error New Cookbook", Message: "New Cookbook's CuisineSid is empty."}
	// Cookbook dtSid 为空
	ErrorCookbookDtSidEmpty = errno.Errno{Code: "Error New Cookbook", Message: "New Cookbook's DtSid is empty."}
	// Cookbook userSid 为空
	ErrorCookbookUserSidEmpty = errno.Errno{Code: "Error New Cookbook", Message: "New Cookbook's UserSid is empty."}
)
