## 一、Gin框架初体验

> gin框架参考连接
>
> [https://gin-gonic.com/](https://gin-gonic.com/)
>
> [https://www.bilibili.com/video/BV1gJ411p7xC?p=3](https://www.bilibili.com/video/BV1gJ411p7xC?p=3)
>
> 本文用gin框架返回json以及postman进行请求

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

## 二、gin的用法

### 1、返回json数据

#### 1.1 使用gin.H返回数据

> gin可以直接返回json数据

```go
// 使用C.JSON进行数据返回
c.JSON(200, gin.H{
		"name": uName,
		"age" : 19,
		"method": "get",
})

//  gin.H 是 map[string]interface{}的简写
// H is a shortcut for map[string]interface{}
type H map[string]interface{}
```

```json
package main

import (
	"github.com/gin-gonic/gin"
	"fmt"
)

func getMethod(c *gin.Context) {
	c.JSON(200, gin.H{
		"name": uName,
		"age" : 19,
		"method": "get",
	})
}

func main() {
	r := gin.Default()
	r.GET("user", getMethod)
	r.Run(":8090")
}
```

![image-20220316214332014](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316214332014.png)

#### 1.2 使用map返回数据

> 可以使用map来返回数据

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func getMethod(c *gin.Context) {
	// 使用map
	data := map[string]interface{}{
		"name": "hum",
		"age": 18,
	}
	c.JSON(200, data)
}

func main() {
	r := gin.Default()
	r.GET("/user", getMethod)
	r.Run(":8090")
}
```

![image-20220316214842921](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316214842921.png)

#### 1.3 使用结构体返回数据

> 可以通过结构体返回json数据

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func getMethod(c *gin.Context) {
	// 使用结构体
	type userInfo struct{
		Name string `json:"name"`
		Age int `json:"age"`
	}
	data := userInfo{
		Name: "sam",
		Age: 19,
	}
	c.JSON(200, data)
}

func main() {
	r := gin.Default()
	r.GET("/user", getMethod)
	r.Run(":8090")
}
```

![image-20220316215225440](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316215225440.png)

### 2、获取get请求参数

> get请求参数就是`querystring`, `querystring`参数就是`url`中`?`后面带的参数，形如 /user?name=li&age=19
>
> 并且每个参数之间用`&`隔开

#### 2.1 Query方法

> gin中使用Query()方法来获取参数以及值，从Query方法源码也可以看出来用法
>
> 注意：
>
> - Query有返回值，是个string
> - 获取不到就是一个空的字符串

```go
// Query源码
// Query returns the keyed url query value if it exists,
// otherwise it returns an empty string `("")`.
// It is shortcut for `c.Request.URL.Query().Get(key)`
//     GET /path?id=1234&name=Manu&value=
// 	   c.Query("id") == "1234"
// 	   c.Query("name") == "Manu"
// 	   c.Query("value") == ""
// 	   c.Query("wtf") == ""
func (c *Context) Query(key string) string {
	value, _ := c.GetQuery(key)
	return value
}
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func getMethod(c *gin.Context) {
	// 获取参数
	name := c.Query("name")
	age := c.Query("age")
	c.JSON(200, gin.H{
		"status" : "ok",
		"name": name,
		"age": age,
	})
}

func main() {
	r := gin.Default()
	r.GET("/user", getMethod)
	r.Run(":8090")
}
```

![image-20220316220031084](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316220031084.png)

#### 2.2 GetQuery方法

> GetQuery方法也可获取参数值，但是除了会返回查到的值，也会返回一个布尔类型，当布尔为`true`表示可以获取值，否则获取不到就返回`false`
>
> 多个参数取值，然后通过返回的布尔值进行判断时，需要注意不能用`&&`(逻辑与)操作符，需要使用`||`（逻辑或），意思是只要有一个为false，就直接返回到错误

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func getMethod(c *gin.Context) {
	// 获取参数
	name, nameOk := c.GetQuery("name")
	age, ageOk := c.GetQuery("age")
	fmt.Printf("name:%v nameOk:%v\n", name, nameOk)
	fmt.Printf("age:%v ageOk:%v\n", age, ageOk)
	if !nameOk || !ageOk {
		fmt.Printf("name参数和age参数未获取到")
		c.JSON(404, gin.H{
			"error": "",
		})
	} else{
		c.JSON(200, gin.H{
			"status" : "ok",
			"name": name,
			"age": age,
		})
	}
}

func main() {
	r := gin.Default()
	r.GET("/user", getMethod)
	r.Run(":8090")
}
```

![image-20220316221116347](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316221116347.png)

![image-20220316221128643](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316221128643.png)

### 3、获取post请求参数

#### 3.1 使用form表单提交数据

> 获取form参数，其实就是通过form表单提交的数据，也就是post请求提交的数据，请求的参数数据是放在了body里面，这种的就是form表单数据

```go
// 使用PostForm方法来获取参数
// PostForm returns the specified key from a POST urlencoded form or multipart form
// when it exists, otherwise it returns an empty string `("")`.
func (c *Context) PostForm(key string) string {
	value, _ := c.GetPostForm(key)
	return value
}
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func postMethod(c *gin.Context) {
	// 获取请求方法
	method := c.Request.Method
	// 获取post参数
	name := c.PostForm("name")
	age := c.PostForm("age")

	c.JSON(200, gin.H{
		"status": "ok",
		"name": name,
		"age": age,
		"method": method,
	})

}

func main() {
	r := gin.Default()
	r.POST("/user", postMethod)
	r.Run(":8090")
}
```

![image-20220316222032369](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316222032369.png)

#### 3.2 使用json提交数据（待定）

> 当然除了form表单数据，也可以使用json的格式
>
> 使用json提交数据，也是经常用的一种方法，比较推荐，在postman中需要选择body->raw->json填写请求的参数键值对

````go
// 代码不变
package main

import (
	"github.com/gin-gonic/gin"
)

func postMethod(c *gin.Context) {
	// 获取请求方法
	method := c.Request.Method
	// 获取post参数
	name := c.PostForm("name")
	age := c.PostForm("name")

	c.JSON(200, gin.H{
		"status": "ok",
		"name": name,
		"age": age,
		"method": method,
	})

}

func main() {
	r := gin.Default()
	r.POST("/user", postMethod)
	r.Run(":8090")
}
````

### 4、获取path参数

> 请求的参数通过url路径传输，比如/user/2002/02/02
>
> 这里user后面的2002就是url路径上的参数，和`?`后面的参数不一样
>
> gin中需要传递的变量使用`:variable`这种格式去写，然后使用c.Param来获取
>
> 并且将请求的方法打印出来了，可以看到是"GET"方法

```go
// 需要使用Param方法进行获取
// Param returns the value of the URL param.
// It is a shortcut for c.Params.ByName(key)
//     router.GET("/user/:id", func(c *gin.Context) {
//         // a GET request to /user/john
//         id := c.Param("id") // id == "john"
//     })
func (c *Context) Param(key string) string {
	return c.Params.ByName(key)
}
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func getData(c *gin.Context) {
	// 获取请求方法
	method := c.Request.Method
	// 获取path参数
	name := c.Param("name")
	age := c.Param("age")
	c.JSON(200, gin.H{
		"status": "ok",
		"name": name,
		"age": age,
		"method": method,
	})
}

func main() {
	r := gin.Default()
	r.GET("/user/:name/:age", getData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220316223722700](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220316223722700.png)

### 5、gin绑定参数

> [https://blog.csdn.net/wohu1104/article/details/121928193](https://blog.csdn.net/wohu1104/article/details/121928193)
>
> 上面是好多种获取参数的方法，可以分开来用
>
> 但是我们也可以通过请求的`Content-Type`的类型通过反射来自动提取请求中的`querystring、form表单、json、xml`等参数到结构体
>
> 所以可以使用`.ShouldBind()`来自动提取这几种类型的数据，并把值绑定到对应的结构体对象上
>
> 绑定参数也就是不需要我们通过上面的哪几种方式去获取参数了，统一使用结构体来提取参数

```go
// ShouldBind
// ShouldBind checks the Content-Type to select a binding engine automatically,
// Depending the "Content-Type" header different bindings are used:
//     "application/json" --> JSON binding
//     "application/xml"  --> XML binding
// otherwise --> returns an error
// It parses the request's body as JSON if Content-Type == "application/json" using JSON or XML as a JSON input.
// It decodes the json payload into the struct specified as a pointer.
// Like c.Bind() but this method does not set the response status code to 400 and abort if the json is not valid.
func (c *Context) ShouldBind(obj interface{}) error {
	b := binding.Default(c.Request.Method, c.ContentType())
	return c.ShouldBindWith(obj, b)
}
```

```go
```

