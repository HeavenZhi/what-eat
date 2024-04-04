/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package config

// Configer 定义配置接口
type Configer interface {
	// InitConfig 初始化配置
	InitConfig() (err error)
}

// Conf 定义全局变量
var Conf = new(ServerConfig)

/*
使用 viper.GetXxx() 读取方式
注意：
Viper 使用的是 mapstructure 为标签
*/

// ServerConfig 定义服务配置
type ServerConfig struct {
	Name    string `mapstructure:"name"`
	Mode    string `mapstructure:"mode"`
	Version string `mapstructure:"version"`
	IP      string `mapstructure:"ip"`
	Port    int    `mapstructure:"port"`

	//snowflake
	StartTime string `mapstructure:"start_time"`
	MachineID int64  `mapstructure:"machine_id"`

	*LogConfig    `mapstructure:"log"`
	*MySQLConfig  `mapstructure:"mysql"`
	*RedisConfig  `mapstructure:"redis"`
	*ConsulConfig `mapstructure:"consul"`
}

// LogConfig 定义日志配置
type LogConfig struct {
	Level         string `mapstructure:"level"`
	Filename      string `mapstructure:"filename"`
	ErrorFilename string `mapstructure:"error_filename"`
	MaxSize       int    `mapstructure:"max_size"`
	MaxAge        int    `mapstructure:"max_age"`
	MaxBackups    int    `mapstructure:"max_backups"`
}

// MySQLConfig 定义 MySQL 配置
type MySQLConfig struct {
	User         string `mapstructure:"user"`
	Password     string `mapstructure:"password"`
	Host         string `mapstructure:"host"`
	Port         int    `mapstructure:"port"`
	DB           string `mapstructure:"dbname"`
	MaxOpenConns int    `mapstructure:"max_open_conns"`
	MaxIdleConns int    `mapstructure:"max_idle_conns"`
}

// RedisConfig 定义 Redis 配置
type RedisConfig struct {
	Password     string `mapstructure:"password"`
	Host         string `mapstructure:"host"`
	Port         int    `mapstructure:"port"`
	DB           string `mapstructure:"dbname"`
	PoolSize     int    `mapstructure:"pool_size"`
	MinIdleConns int    `mapstructure:"min_idle_conns"`
}

// ConsulConfig 定义 Consul 配置
type ConsulConfig struct {
	Addr string `mapstructure:"addr"`
}
