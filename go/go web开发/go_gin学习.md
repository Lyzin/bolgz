## 一、Gin框架初体验

> gin框架参考连接
>
> [https://gin-gonic.com/](https://gin-gonic.com/)
>
> [https://www.bilibili.com/video/BV1gJ411p7xC?p=3](https://www.bilibili.com/video/BV1gJ411p7xC?p=3)

### 1、go mod安装gin

> 在`go1.11`以后的版本推荐使用`go mod`管理版本依赖的问题，关于`go mod`的使用，可移步`go语言基础`中查看

#### 1.1 创建项目目录

> 打开goland，找一个需要存放web代码的任意文件夹，比如`gin_demo`这个文件夹，然后使用goland以项目形式打开`gin_demo`，此时`gin_demo`文件夹下会显示什么内容都没有

#### 1.2 go mod初始化

> 此时goland打开以后，`gin_demo`文件夹下什么东西都没有，所以需要使用如下命令进行`mod依赖`配置文件的初始化

```bash
# 以当前的gin_demo文件夹作为mod里的模块名
go mod init gin_demo
# go mod 此时可能会提示需要go mod tidy，如果提示了就执行，没提示可以先忽略
# go mod tidy主要用来根据go.mod里的依赖包进行自动拉取或者将不用的包删除
```

![image-20220307235440072](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220307235440072.png)

#### 1.3 安装gin

> 至此，我们项目初始化已经做好了，可以安装gin框架进行使用了，这里需要注意有两种方式可以安装gin：
>
> - 第一种，可以写一个main.go文件，里面写上gin的样板代码
>   - 样板代码可以从gin官网复制并且可以跑起来的
>   - 然后执行`go mod tidy`，此时go会自动拉取github上最新的gin包
>   - 需要注意的是如果拉不下需要看下`GO111MODULE`和`GOPROXY`有没有设置，
> - 第二种，当go.mod创建好以后，直接使用go get拉取gin这个包
>   - `go get github.com/gin-gonic/gin`命令来下载安装gin框架
>   - 此时下载以后还看不到包被拉到哪了，所以可以创建一个main.go，使用gin的样板代码，然后再执行，就可以看到goland引入了外部的包

![image-20220308000232662](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220308000232662.png)

### 2、Gin基础代码迭代

#### 2.1 基础版

> 下面代码来自Gin的官网

```go
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
```

#### 2.2 进阶版

> 抽离`r.GET`里的匿名函数，`r.GET`里除了传`访问路径`，还需要传一个函数名，先看源码
>
> 从源码可以看到，HandlerFunc需要传入的参数类型是`*Context`。所以抽离出来以后，传入的参数指定类型必须是`*gin.Context`

```go
// GET方法源码
func (group *RouterGroup) GET(relativePath string, handlers ...HandlerFunc) IRoutes {
	return group.handle(http.MethodGet, relativePath, handlers)
}
//  参数handlers ...HandlerFunc 这个HandlerFunc是解释如下
// HandlerFunc defines the handler used by gin middleware as return value.
type HandlerFunc func(*Context)

// func(*Context)里面的的Context是一个结构体，因为这个结构体字段很多，所以需要使用指针来接收
```

```go
/*
  @Author: lyzin
    @Date: 2022/03/07 21:35
    @File: gin_demo
    @Desc: 
*/
package main

import (
	"github.com/gin-gonic/gin"
)

func getMethod(c *gin.Context) {
	c.JSON(200, gin.H{
		"name": "sam",
		"age" : 19,
		"method": "get",
	})
}

func postMethod(c *gin.Context) {
	c.JSON(200, gin.H{
		"name": "sam",
		"age" : 19,
		"method": "post",
	})
}

func putMethod(c *gin.Context) {
	c.JSON(200, gin.H{
		"name": "sam",
		"age" : 19,
		"method": "put",
	})
}

func deleteMethod(c *gin.Context) {
	c.JSON(200, gin.H{
		"name": "sam",
		"age" : 19,
		"method": "delete",
	})
}

func main() {
	r := gin.Default()
	r.GET("/ping", getMethod)
	r.POST("/ping", postMethod)
	r.PUT("/ping", putMethod)
	r.DELETE("/ping", deleteMethod)
	r.Run(":8090")
}
```



