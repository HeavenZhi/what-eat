/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package errno

import "fmt"

// 定义错误码
type Errno struct {
	Code    string
	Message string
}

func (e Errno) Error() string {
	return fmt.Sprintf("[%s]: %s", e.Code, e.Message)
}

// 定义一个实现了ErrorInterface的Error结构体
type Error struct {
	*Errno       // 错误码
	Errord error // 保存内部错误信息
}

// 使用 错误码 和 error 创建新的 错误
func NewError(errno *Errno, err error) error {
	return &Error{
		Errno:  errno,
		Errord: err,
	}
}

func (e Error) Error() string {
	return fmt.Sprintf("[%s]: %s, Internal error: %s", e.Code, e.Message,e.Errord)
}
