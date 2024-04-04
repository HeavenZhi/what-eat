/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package config

import (
	"fmt"

	"github.com/fsnotify/fsnotify"
	"github.com/spf13/viper"
)

// ViperConfig 配置文件解析器
type ViperConfig struct {
	filePath string
}

// NewViperConfig 创建 Viper 配置解析器对象
func NewViperConfig(filePath string) *ViperConfig {
	return &ViperConfig{
		filePath: filePath,
	}
}

// InitConfig 整个服务配置文件初始化方法
func (v *ViperConfig) InitConfig() (err error) {
	//方式1:直接指定配置文件路径（相对路径或绝对路径）
	//相对路径：相对执行的可执行文件的相对路径
	// viper.SetConfigFile("./conf/config.yml")
	viper.SetConfigFile(v.filePath)

	//查找并读取配置文件
	err = viper.ReadInConfig()
	if err != nil {
		//读取配置信息失败
		fmt.Printf("viper.ReadInConfig failed, err: %v\n", err)
		return err
	}

	/*
		如果使用的是 viper.GetXxx() 方式使用配置的话，就无需下面的操作
	*/

	//把读取到的配置信息反序列化到 Config 变量中
	if err := viper.Unmarshal(Conf); err != nil {
		fmt.Printf("viper.Unmarshal failed, err: %v\n", err)
	}

	// 监听配置文件变化，自动读取配置文件的最新变化
	viper.WatchConfig()
	viper.OnConfigChange(func(in fsnotify.Event) {
		fmt.Println("！！！！！夭寿啦！！！！！配置文件被修改了！！！！！")
		if err := viper.Unmarshal(Conf); err != nil {
			fmt.Printf("viper.Unmarshal failed, err:%v\n", err)
		}
	})

	return nil
}
