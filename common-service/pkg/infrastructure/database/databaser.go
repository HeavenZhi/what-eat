/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package database

// DataBaser 数据库接口
type DataBaser interface {
	// InitDataBaseConnect 初始化数据库连接
	InitDataBaseConnect() (err error)
}
