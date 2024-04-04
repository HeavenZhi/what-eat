# cookbook-service

**cookbook-service** 是 **what-eat** 项目的一个子服务项目，是主要用于菜谱部分的微服务。

## 项目结构

```shell
.
├── api
│   ├── base.pb.go
│   ├── cookbook_list_grpc.pb.go
│   ├── cookbook_list.pb.go
│   ├── cookbook.pb.go
│   ├── ingredient_list_grpc.pb.go
│   ├── ingredient_list.pb.go
│   ├── ingredient.pb.go
│   └── proto
│       ├── base.proto
│       ├── cookbook_list.proto
│       ├── cookbook.proto
│       ├── ingredient_list.proto
│       └── ingredient.proto
├── cmd
│   └── main.go
├── config
│   └── config.yml
├── db
│   └── whateat-cookbook.sql
├── go.mod
├── go.sum
├── internal
│   ├── biz
│   ├── data
│   │   ├── init.go
│   │   ├── mysql
│   │   └── redis
│   ├── handler
│   │   ├── cookbook_handler.go
│   │   └── handler.go
│   ├── middleware
│   └── model
│       ├── basemodel.go
│       ├── cookbook_details_cooking.go
│       ├── cookbook_details.go
│       ├── cookbook_details_ingredient.go
│       ├── cookbook.go
│       ├── cooking_health.go
│       ├── cuisine.go
│       ├── dishes_type.go
│       ├── ingredient.go
│       ├── ingredient_kind.go
│       ├── ingredient_template.go
│       └── ingredient_type.go
└── README.md
```

## 项目流程

**cookbook-service** 的主要包都位于`internal`内，其项目运作流程大致为：

$$
\begin{CD}
handler @>>> biz @>>> data @>>> MySQL/Redis/ES\\\\
处理函数(参数处理) @>>> 业务逻辑 @>>> 数据操作 @>>> 数据
\end{CD}
$$