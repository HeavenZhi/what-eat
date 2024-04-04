/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package logger

// Logger 日志接口
type Logger interface {
	// InitLog 初始化日志
	InitLog() (err error)
}
