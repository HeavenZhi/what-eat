/*
	Copyright 2024 HeavenZhi. All rights reserved.
	Use of this source code is governed by a MIT style
	license that can be found in the LICENSE file.
*/

package database

import (
	"fmt"
	"log"
	"time"

	"github.com/HeavenZhi/what-eat/common-service/pkg/infrastructure/config"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

// 定义全局 MySQL 数据库连接
var MySQLDB *gorm.DB

// MySQLDataBase 数据库连接
type MySQLDataBase struct {
	mysqlCfg *config.MySQLConfig
}

// NewMySQLDataBase 创建 MySQL 数据库
func NewMySQLDataBase(mysqlCfg *config.MySQLConfig) *MySQLDataBase {
	return &MySQLDataBase{
		mysqlCfg: mysqlCfg,
	}
}

// InitDataBaseConnect 初始化 MySQL 连接
func (m *MySQLDataBase) InitDataBaseConnect() (err error) {
	//1.使用 go get -u gorm.io/gorm 安装导入 GORM 的标准库
	//2.使用 go get -u gorm.io/driver/mysql 安装导入 MySQL 驱动
	//3.准备连接数据库的数据源(DSN)信息，Data Source Name，数据库源名
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local", m.mysqlCfg.User, m.mysqlCfg.Password, m.mysqlCfg.Host, m.mysqlCfg.Port, m.mysqlCfg.DB)

	//4.使用 gorm.Open() 连接数据库
	MySQLDB, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalln("[Gorm Failed]: initialize failed the mysql connection", err)
	}

	/* 一般情况下，使用 gorm 上面的配置就够了，如果需要进一步配置细节，可以继续配置下面的操作 */

	/*
		设置额外的连接池配置，以下配置需要配合 mysql 的自有配置 my.conf 进行设置
	*/

	//db.DB() 返回的就是 database/sql.DB
	sqlDB, err := MySQLDB.DB()
	if err != nil {
		return err
	}

	//SetMaxIdleConns 设置空闲连接池中连接的最大数量
	sqlDB.SetMaxIdleConns(m.mysqlCfg.MaxIdleConns)

	//SetMaxOpenConns 设置打开数据库连接的最大数量
	sqlDB.SetMaxOpenConns(m.mysqlCfg.MaxOpenConns)

	//SetConnMaxLifetime 设置了连接可复用的最大时间
	sqlDB.SetConnMaxLifetime(time.Hour)
	
	return nil
}
