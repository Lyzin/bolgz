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

## 二、gin基础用法

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

// shouldBind绑定数据顺序
1.如果是get请求，只是用form绑定引擎(query)
2.如果是post请求，先检查content-type是不是JSON/XML，然后再使用form(form-data)
```

#### 5.1 结构体字段小写

> 使用结构体绑定传过来的参数，当结构体里的字段都是小写的时候，会发现请求时传过来的值获取不到，如下代码

```go
package main

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	name string
	age string
}

func bindUserData(c *gin.Context) {
	var userObj UserInfo
	err := c.ShouldBind(&userObj)
	if err != nil {
		c.JSON(404, gin.H{
			"errNo": 404,
			"msg": err,
		})
	} else{
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": userObj,
		})
	}
}

func main() {
	r := gin.Default()
	r.GET("/userinfo", bindUserData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321210054599](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321210054599.png)

#### 5.2 结构体字段大写

> 为什么获取不到呢？因为结构体我们是gin这个包要访问我们定义的结构体里的字段，在go语言中，一个包要访问另一个包里的字段，这个字段首字母必须是大写的才可以被访问到，那么我们将结构体字段改成大写试试

```go
package main

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	Name string
	Age string
}

func bindUserData(c *gin.Context) {
	var userObj UserInfo
	err := c.ShouldBind(&userObj)
	if err != nil {
		c.JSON(404, gin.H{
			"errNo": 404,
			"msg": err,
		})
	} else{
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": userObj,
		})
	}
}

func main() {
	r := gin.Default()
	r.GET("/userinfo", bindUserData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321210628756](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321210628756.png)

> 可以看到有返回值了，但是返回值是空的，返回的是结构体字段的零值，那么也就表示在`shouldBind`的时候，传进来的参数`name`和`age`仍然没有找到对应字段进行绑定，因为结构体字段是首字母大写的，那么我们把请求里的`name`和`age`改成首字母大写试试

![image-20220321210841637](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321210841637.png)

#### 5.3 请求字段都小写

> 可以看到有数据返回了，但是我们不想要在请求和返回时的字段值首字母大写，那么就需要添加结构体tag了，tag表示是用了反射
>
> gin中：
>
> - GET请求大多用`form`这个tag

```go
package main

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	Name string `form:"name"`
	Age string `form:"age"`
}

func bindUserData(c *gin.Context) {
	var userObj UserInfo
	err := c.ShouldBind(&userObj)
	if err != nil {
		c.JSON(404, gin.H{
			"errNo": 404,
			"msg": err,
		})
	} else{
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": userObj,
		})
	}
}

func main() {
	r := gin.Default()
	r.GET("/userinfo", bindUserData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321211550814](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321211550814.png)

#### 5.4 响应字段都小写

> 从上图可以看出，请求传进来的小写参数可以被定义的结构体对应字段接收了，但是返回响应里还是大写，因为返回的是json，所以需要再添加一下json这个tag，这样就满足了请求和响应都是小写字段了

```go
package main

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	Name string `form:"name" json:"name"`
	Age string `form:"age" json:"age"`
}

func bindUserData(c *gin.Context) {
	var userObj UserInfo
	err := c.ShouldBind(&userObj)
	if err != nil {
		c.JSON(404, gin.H{
			"errNo": 404,
			"msg": err,
		})
	} else{
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": userObj,
		})
	}
}

func main() {
	r := gin.Default()
	r.GET("/userinfo", bindUserData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321211734519](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321211734519.png)

#### 5.5 请求和响应使用的tag总结

> `form`这个tag负责将接收进来的参数进行转化，让内部的结构体可以接收到并赋值
>
> `json`这个tag负责将对应结构体字段以小写形式给返回

#### 5.6 json数据请求

> 在前后端分离的项目，前端请求的参数也大多是以json格式来发请求，所以绑定参数也可以来处理json的请求

```go
package main

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	Name string `form:"name" json:"name"`
	Age int `form:"age" json:"age"`
}

func bindUserData(c *gin.Context) {
	var userObj UserInfo
	err := c.ShouldBind(&userObj)
	if err != nil {
		c.JSON(404, gin.H{
			"errNo": 404,
			"msg": err,
		})
	} else{
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": userObj,
		})
	}
}

func main() {
	r := gin.Default()
	r.POST("/jsondata", bindUserData)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321212437785](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321212437785.png)

### 6、文件上传

#### 6.1 单个文件上传

> 处理multipart forms提交文件时默认的内存限制是32MiNB
>
> 可以通过gin中的MaxMultipartMemory 进行修改

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"path"
)

func uploadFile(c *gin.Context) {
	// 从请求中读取文件
	//fobj, err := c.FormFile("pic")
	fobj, err := c.FormFile("pic")
	if err != nil {
		c.JSON(500, gin.H{
			"errNo": 500,
			"action": "读取文件错误",
			"msg": err.Error(),
			"fobj": fobj,
		})
	} else{
		fmt.Printf("fobj:%v\n", fobj)
		// 将读取的文件保存在本地(服务端本地)
		dst := path.Join("./", fobj.Filename)
		err := c.SaveUploadedFile(fobj, dst)
		if err != nil {
			c.JSON(500, gin.H{
				"errNo": 500,
				"action": "保存文件错误",
				"msg": err,
			})
		}
		c.JSON(200, gin.H{
			"errNo": 200,
			"msg": "保存文件成功",
		})

	}
}


func main() {
	r := gin.Default()
	r.POST("/uploadfile", uploadFile)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

> 下图是在postman请求的截图
>
> - 第一张是设置`header`里的`Content-Type`为：`multipart/form-data; boundary=<calculated when request is sent>`
>   - 这个`boundary`一定要有，否则会爆这个错误：`no multipart boundary param in Content-Type`
> - 第二张图是设置body里的请求，设置`pic`参数的类型为`file`，然后进行上传

![image-20220321220609748](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321220609748.png)

![image-20220321220803728](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321220803728.png)

### 7、重定向

> gin中可以对路由进行重定向，当前这部分是前端需要干的活

#### 7.1 请求重定向

```go
//表示将`index`这个函数的请求转发到百度
c.Redirect(301, "http://www.baidu.com")
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func indexFunc(c *gin.Context) {
	// 请求重定向
	c.Redirect(301, "http://www.baidu.com")
}


func main() {
	r := gin.Default()
	r.GET("/index", indexFunc)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

#### 7.2 路由重定向

> 请求时转换到/xx的路由处理函数

```go
// 路由重定向,将请求转给user这个路由对应的函数
c.Request.URL.Path = "/user"
// 用router下的HandleContext处理上下文
r.HandleContext(c)
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func indexFunc(c *gin.Context) {
	// 路由重定向
	c.Request.URL.Path = "/user"
	r.HandleContext(c)
}

func userFunc(c *gin.Context) {
	// 请求重定向
	c.JSON(200, gin.H{
		"action": "this is userFunc",
		"msg": "ok",
	})
}


func main() {
	r.GET("/index", indexFunc)
	r.GET("/user", userFunc)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220321224528484](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220321224528484.png)

> 从上图可以看出，访问`/index`返回了`/user`对应函数的结果

### 8、gin的路由

#### 8.1 路由 

> gin中路由使用的就是`httprouter`这个库

> 路由就是访问的`url`，`url`在`gin`中指向了处理的函数

```go
package main

import (
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userFunc(c *gin.Context) {
	c.JSON(200, gin.H{
		"action": "this is userFunc",
		"msg": "ok",
	})
}

func main() {
	r.GET("/user", userFunc)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322205612475](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322205612475.png)

#### 8.2 路由组

> 路由组就是将一组拥有共同前缀的路由，将公共前缀提取出来，组件一个组，然后这个组里再进行其他路由划分

```go
// Group前缀
// Group creates a new router group. You should add all the routes that have common middlewares or the same path prefix.
// For example, all the routes that use a common middleware for authorization could be grouped.
// 翻译
/*
    组创建一个新的路由器组。你应该添加所有有共同的中间件或相同路径前缀的路由。
    例如，所有使用共同的中间件进行授权的路由都可以被分组。
*/

func (group *RouterGroup) Group(relativePath string, handlers ...HandlerFunc) *RouterGroup {
	return &RouterGroup{
		Handlers: group.combineHandlers(handlers),
		basePath: group.calculateAbsolutePath(relativePath),
		engine:   group.engine,
	}
}
```

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userAddr(c *gin.Context) {
	c.JSON(200, gin.H{
		"msg": "this is user addr",
	})
}

func userInfo(c *gin.Context) {
	c.JSON(200, gin.H{
		"msg": "this is user info",
	})
}

func main() {
	userGroup := r.Group("/user")
	fmt.Printf("userGroup: %+v\n", *userGroup)
	{
		userGroup.GET("/addr", userAddr)
		userGroup.GET("/info", userInfo)
	}
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

#### 8.3 路由组的值

![image-20220322211113679](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322211113679.png)

> 从启动gin的截图来看，userGroup是RouterGroup结构体类型，里面有`basePath`这个字段，表示是公共的路径，所以访问`/user/info`时，先找`/user`这个路由组，再从`/user`这个路由组里去找`/info`这个路由，找到就返回值，找不到就提示404

![image-20220322211323252](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322211323252.png)

![image-20220322211343422](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322211343422.png)

#### 8.4 路由组嵌套

> 路由组也支持嵌套，就是路由组里继续套用一个路由组，那么访问的链接就是形如：/group1/group2/xxx

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userAddr(c *gin.Context) {
	c.JSON(200, gin.H{
		"msg": "this is user addr",
	})
}

func userInfo(c *gin.Context) {
	c.JSON(200, gin.H{
		"msg": "this is user info",
	})
}

func main() {
	userGroup := r.Group("/user")
	fmt.Printf("userGroup: %+v\n", *userGroup)
	{
		userGroup.GET("/addr", userAddr)
		infoGroup := userGroup.Group("/info")
		{
			infoGroup.GET("/pinfo", userInfo)
		}
	}
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322213637665](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322213637665.png)

![image-20220322213650783](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322213650783.png)

#### 8.5 路由组用处

> 可以看到有共同的路由前缀，就可以表示不同的业务线，或者Api版本区分

### 9、Any任意请求

> any函数可以接收任意请求方法，下面是代码和截图可以看出来不管是get还是post都可以来请求
>
> 从源代码可以看出来，any包装了所有的请求方式

```go
// any源代码
// Any registers a route that matches all the HTTP methods.
// GET, POST, PUT, PATCH, HEAD, OPTIONS, DELETE, CONNECT, TRACE.
func (group *RouterGroup) Any(relativePath string, handlers ...HandlerFunc) IRoutes {
	group.handle(http.MethodGet, relativePath, handlers)
	group.handle(http.MethodPost, relativePath, handlers)
	group.handle(http.MethodPut, relativePath, handlers)
	group.handle(http.MethodPatch, relativePath, handlers)
	group.handle(http.MethodHead, relativePath, handlers)
	group.handle(http.MethodOptions, relativePath, handlers)
	group.handle(http.MethodDelete, relativePath, handlers)
	group.handle(http.MethodConnect, relativePath, handlers)
	group.handle(http.MethodTrace, relativePath, handlers)
	return group.returnObj()
}
```

```go
package main

import (
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userAddr(c *gin.Context) {
	c.JSON(200, gin.H{
		"msg": "this is user addr",
	})
}

func main() {
	r.Any("/useraddr", userAddr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322212449668](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322212449668.png)

![image-20220322212501626](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322212501626.png)

### 10、NoRoute函数

> gin中有一个NoRoute函数，可以定义当路由找不到时的错误信息，表示所有找不到路由都指到这个函数下，当然也可以对路由组设定自己的NoRoute处理函数
>
> - NoRoute不需要指定路由，直接传入处理NoRoute的函数即可

```go
package main

import (
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func notFoundErr(c *gin.Context) {
	c.JSON(404, gin.H{
		"msg": "router not found in server",
	})
}

func main() {
	r.NoRoute(notFoundErr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322213003931](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322213003931.png)

## 三、Gin中间件

### 1、中间件简介

> gin可以允许在处理请求过程中，加入开发者自己的处理函数，这些函数就是中间件，中间件适合处理：
>
> - 公共的业务逻辑
>   - 比如登录认证、权限校验、数据分页、记录日志等等

```go

```

![image-20220322215119814](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322215119814.png)

> 从上图就可以看出来，当浏览器发起请求时，先经过中间件处理以后，再转给真正的路由函数处理，最后再将结果返回给浏览器
>
> 这样就做到了拦截请求，然后对请求做处理后再转给真正的路由函数，这也是钩子函数

### 2、中间件注册

> `gin`中的中间件必须是`gin.HandlerFunc`类型，这个类型也是路由处理函数的类型
>
> 中间件函数是可以有值的

#### 2.1 在路由处理函数中注册

> 可以在每个路由请求前加入中间件注册函数
>
> `mw1`函数就是中间件函数

```go
// mw1 就是中间件函数
r.GET("/user", mw1, userInfo)
```

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userInfo(c *gin.Context) {
	fmt.Printf("这是userInfo函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userInfo函数",
	})
}

// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
}


func main() {
	r.GET("/user", mw1, userInfo)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322220010964](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322220010964.png)

![image-20220322220024407](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322220024407.png)

> 从执行结果来看，中间件函数先执行，再执行的后面的路由函数

#### 2.2 在全局注册

> 当有很多个函数都需要中间件函数的时候，每个路由函数注册的前面都需要写中间件函数就比较麻烦，所以可以设置为全局注册模式

```go
// 全局注册
r.Use(中间件函数)

// Use attaches a global middleware to the router. ie. the middleware attached though Use() will be
// included in the handlers chain for every single request. Even 404, 405, static files...
// For example, this is the right place for a logger or error management middleware.
func (engine *Engine) Use(middleware ...HandlerFunc) IRoutes {
	engine.RouterGroup.Use(middleware...)
	engine.rebuild404Handlers()
	engine.rebuild405Handlers()
	return engine
}
```

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userInfo(c *gin.Context) {
	fmt.Printf("这是userInfo函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userInfo函数",
	})
}

func userAddr(c *gin.Context) {
	fmt.Printf("这是userAddr函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userAddr函数",
	})
}

// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
}

func main() {
	r.Use(mw1)
	r.GET("/userinfo", userInfo)
	r.GET("/useraddr", userAddr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322222144657](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322222144657.png)

![image-20220322222159652](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322222159652.png)

![image-20220322222126918](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322222126918.png)

### 3、中间件函数里的Next

> 既然中间件执行完以后就会执行路由函数，那么为什么还需要`Next`函数呢？从下面的分析可以看出来
>

#### 3.1 中间件函数里没有Next函数

> 中间函数里没有Next函数，相当于先把中间件函数都执行完以后，再执行后面的路由函数，这样就做不到以一些条件来决定是否要执行后面的路由函数了，因为一股脑的把中间件函数都执行完了，从下面的执行结果图就可以看到

```go
// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1开始执行了\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
	fmt.Printf("这是中间件函数mw1执行完了\n")
}
```

![image-20220322223206926](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322223206926.png)

#### 3.2 中间件函数里有Next函数

> 中间函数里的Next函数，相当于是遇到Next函数是，会先调用后面的路由处理函数，当后面的路由处理函数处理完成以后，再来执行中间件函数剩余部分代码，这样就可以做到以一些条件来控制是否要执行路由函数，比如权限控制等功能
>
> - 从下图也可以看出来，先执行了中间件函数的开始部分，遇到Next函数后去处理后面的userAddr这个路由函数了，当userAddr路由函数处理完成后，并将路由函数处理的基础进行返回，再又回来接着处理中间件函数的剩余代码功能了

```go
// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1开始执行了\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
	c.Next()
	fmt.Printf("这是中间件函数mw1执行完了\n")
}

```

![image-20220322223410381](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322223410381.png)

![image-20220322224817341](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322224817341.png)

### 4、中间件函数里的Abort

> Abort函数用户`不处理`中间件后面的路由函数，表示放弃执行
>
> 从下图可以看出只执行了中间件函数，中间件后面的路由函数并没有执行

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userInfo(c *gin.Context) {
	fmt.Printf("这是userInfo函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userInfo函数",
	})
}

func userAddr(c *gin.Context) {
	fmt.Printf("这是userAddr函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userAddr函数",
	})
}

// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1开始执行了\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
	c.Abort()
	fmt.Printf("这是中间件函数mw1执行完了\n")
}

func main() {
	r.Use(mw1)
	r.GET("/userinfo", userInfo)
	r.GET("/useraddr", userAddr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322230832839](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322230832839.png)

![image-20220322230841974](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322230841974.png)

### 5、多个中间件函数

> 当有多个中间件函数时，执行的顺序如下

```go
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userInfo(c *gin.Context) {
	fmt.Printf("这是userInfo函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userInfo函数",
	})
}

func userAddr(c *gin.Context) {
	fmt.Printf("这是userAddr函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userAddr函数",
	})
}

// 自定义的中间件函数
func mw1(c *gin.Context) {
	fmt.Printf("这是中间件函数mw1开始执行了\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw1",
	})
	c.Next()
	fmt.Printf("这是中间件函数mw1执行完了\n")
}

// 自定义的中间件函数
func mw2(c *gin.Context) {
	fmt.Printf("这是中间件函数mw2开始执行了\n")
	c.JSON(200, gin.H{
		"msg": "这是中间件函数mw2",
	})
    // 继续调用后面的路由函数
	c.Next()
	fmt.Printf("这是中间件函数mw2执行完了\n")
}

func main() {
	r.Use(mw1, mw2)
	r.GET("/userinfo", userInfo)
	r.GET("/useraddr", userAddr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

![image-20220322225047911](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322225047911.png)

![image-20220322225100631](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322225100631.png)



> 可以看到是按中间件函数注册的顺序，先执行中间件函数开始的代码，遇到Next函数时，转过头去执行路由处理函数，当路由处理函数执行完以后，再来执行和路由函数挨得最近的那个中间件函数，依次往外执行中间件函数，直到执行完成

![image-20220322230038530](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322230038530.png)

> 从上图可以看出
>
> - 执行mw1函数开始时，接着遇到Next函数，mw1里的Next函数执行的就是mw2函数里的代码
> - 接着执行mw2函数里的代码开始，接着遇到Next函数，mw2里的Next函数执行的就是useraddr路由函数的代码
> - useraddr路由函数执行完成以后，mw2里的Next函数执行完成，接着执行mw2函数结束代码
> - mw2函数结束代码执行完成以后， mw1的next函数执行完成
> - 最后执行mw1函数结束代码，请求结束完成

### 6、中间件可以传参

> 定义一个闭包函数，返回一个匿名函数，匿名函数的类型是`gin.HandlerFunc`，这那么这样就做到了一个中间件既可以传参，返回值又符合gin需要的中间件函数类型

```go
// 中间件函数可以传参的写法
// 自定义的中间件函数
func authV1(checkLogin bool) gin.HandlerFunc{
	return func(c *gin.Context) {
		if checkLogin {
			fmt.Println("校验权限通过")
			c.Next()
		} else {
			fmt.Println("校验权限失败")
			c.Abort()
		}
	}
}
```

```go
// 完整代码
package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

var r = gin.Default()

func userInfo(c *gin.Context) {
	fmt.Printf("这是userInfo函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userInfo函数",
	})
}

func userAddr(c *gin.Context) {
	fmt.Printf("这是userAddr函数\n")
	c.JSON(200, gin.H{
		"msg": "这是userAddr函数",
	})
}

// 自定义的中间件函数
func authV1(checkLogin bool) gin.HandlerFunc{
	return func(c *gin.Context) {
		if checkLogin {
			fmt.Println("校验权限通过")
			c.Next()
		} else {
			fmt.Println("校验权限失败")
			c.Abort()
		}
	}
}

func main() {
	r.Use(authV1(false))
	r.GET("/userinfo", userInfo)
	r.GET("/useraddr", userAddr)
	err := r.Run(":8090")
	if err != nil {
		return
	}
}
```

> 当传参为false时，不会执行路由处理函数

![image-20220322233053545](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322233053545.png)

> 当传参为true时，则执行路由处理函数

![image-20220322233139511](go_gin%E5%AD%A6%E4%B9%A0.assets/image-20220322233139511.png)

### 7、路由组注册中间件

> 路由组也可以注册中间件，有两种方式

#### 7.1 注册方式一

> 在生成路由组的时候，将中间件注册进去







#### 7.2 注册方式二

















## 四、GORM

1、
