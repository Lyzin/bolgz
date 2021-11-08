## 一、GO语言简介与配置

### 1、Go包的官方地址

> 官网：https://golang.org/dl/
>
> 国内镜像站：https://golang.google.cn/dl

### 2、Go优势

> 交叉编译、编译快速
>
> 开发效率高
>
> 执行性能好
>
> 天生支持并发
>
> 使用`UTF-8`编码方式来存放代码

### 3、学习记录

> 使用`golang Idea`编辑器或`vs code`，但是不要开启自动提示功能，使用省电模式，因为一开始就自己手写所有语法才能记得住

### 4、第一个Go程序

```go
package main

import "fmt"

func main() {
  fmt.Println("Hello world!!!")
}
```

- 执行结果

![image-20211026110718850](go%E7%AC%94%E8%AE%B0.assets/image-20211026110718850.png)

### 5、GO版本

![image-20211026110955968](go%E7%AC%94%E8%AE%B0.assets/image-20211026110955968.png)

### 6、GOPATH

> `gopath`是环境变量，用来表明写的`go`项目的工作目录
>
> `gopath`最好设置一个，所有代码都放到`gopath`的`src`目录下

- 创建GO项目的步骤

  > 1. 创建一个目录作为存放`Go`语言代码，比如：`/xx/go`
  > 2. 在环境变量中新增 `GOPATH:/xx/go`
  > 3. 在`/xx/go`下新建三个文件夹，分别为
  >    1. `bin`：用来存放我们写好的go代码编译后的二进制文件
  >    2. `src`：存放`go`语言的源代码，以及第三方下载的源代码
  >       1. 常见的`src`中代码目录结构就是：`golang.org`(网站域名) -> `username`(作者机构) -> 项目1/项目2(项目名) -> 模块A/模块B/模块C/模块D
  >    3. `pkg`：存放编译后的库文件或缓存文件
  > 4. 最后把`/xx/go/bin`目录添加到`PATH`里即可

### 7、MAC配置自定义GOPATH

> 通过`go env`查看go的所有环境变量，包括`gopath`

- 先看默认的`go env`

![image-20211026113415106](go%E7%AC%94%E8%AE%B0.assets/image-20211026113415106.png)

> - 可以看到默认的`GOPATH`是在: `/Users/xxx/go`下面，是`go`默认的`GOPATH`，同时可以到这个目录里去看，会看到有三个目录，也就是我们需要手动创建的三个目录
>
> ![image-20211026113713432](go%E7%AC%94%E8%AE%B0.assets/image-20211026113713432.png)
>
> - `GOROOT`是`GO`安装包的位置
>
> - 接下来创建自己的`GOPATH`

#### 7.1 创建目录

- 创建go目录以及那三个目录

![image-20211026113846716](go%E7%AC%94%E8%AE%B0.assets/image-20211026113846716.png)

#### 7.2 添加环境变量

> 1. 编辑：`vim   ~/.zshrc`
>
> 2. 添加如下内容
>
>    ```bash
>    export GOPATH=/Users/xxx/Desktop/Code/go_study
>    export PATH=${GOPATH}/bin:$PATH
>    ```
>
> 3. 重新加载配置文件：`source  ~/.zshrc`

#### 7.3 查看GOPATH

> 1. 重新查看`GOPATH`，可以看到`GOPATH`已经修改过来了

![image-20211026114200717](go%E7%AC%94%E8%AE%B0.assets/image-20211026114200717.png)

### 8、Windows配置GOPATH

> 在官网下载`GO`的安装包，默认安装完会配置默认的`GOROOT`和`GOPATH`

- 默认的`GOPATH`

  ![image-20211103003520566](go%E7%AC%94%E8%AE%B0.assets/image-20211103003520566.png)

- 在环境变量中默认显示`GOPATH`和`GOPATH`下的`bin`

  - 在环境变量里打开会显示成这样：`GOPATH=%USERPROFILE%\go`

    ![image-20211103004055548](go%E7%AC%94%E8%AE%B0.assets/image-20211103004055548.png)

  - 然后看到`%USERPROFILE%\go`解析出来就是`C:\User\XXX\go`

  ![image-20211103003651813](go%E7%AC%94%E8%AE%B0.assets/image-20211103003651813.png)

  - 打开PATH可以看到最后一条是：`%USERPROFILE%\go\bin`
  - 所以需要修改为自己的`GOPATH`和`GOPATH\bin`

  ![image-20211103003726031](go%E7%AC%94%E8%AE%B0.assets/image-20211103003726031.png)

#### 8.1 修改自己的GOPATH值

> 在存放`go`代码的位置创建目录，将对应的目录地址填写过来

![image-20211103004455355](go%E7%AC%94%E8%AE%B0.assets/image-20211103004455355.png)

#### 8.2 修改`GOPATH\bin`

> 需要在`PATH`这个环境变量修改，修改成：`%GOPATH%\bin`，表示进到在上面设置的`GOPATH`的`bin`目录下

![image-20211103004636063](go%E7%AC%94%E8%AE%B0.assets/image-20211103004636063.png)

#### 8.3 检查`GOPATH`

> 看到已经修改过来了

![image-20211103004908553](go%E7%AC%94%E8%AE%B0.assets/image-20211103004908553.png)

### 9、创建代码目录

> 按照上述说明的进行创建目录

![image-20211026115327001](go%E7%AC%94%E8%AE%B0.assets/image-20211026115327001.png)

## 二、运行代码

### 1、第一行代码

```go
package main

import "fmt"

func main() {
	fmt.Println("hello world!")
}
```

![image-20211026110718850](go%E7%AC%94%E8%AE%B0.assets/image-20211026110718850.png)

### 2、编译build

> 构建`go`代码:`go build`
>
> - 是通过`GOPATH`去找代码，`GOPATH`在哪，`GO BUILD`就执行在哪
>
> 通过`-o`可以指定编译的可执行程序的名字: `go build -o 'hello'`

### 3、运行run

> 直接运行代码
>
> `go run xxx.go`

### 4、安装install

> 分为两步
>
> - 先编译得到一个可执行编译文件
> - 然后将可执行文件拷贝到`GOPATH/bin`目录

### 5、单引号双引号

```json
在go语法中，双引号是常用的来表达字符串，如果你使用了单引号，编译器会提示出错

invalid character literal (more than one character)
``
单引号只能包含一个字符，例如’b’ ,程序会输出98表示字符b的ascii码。

如果非要使用单引号输出必须使用string函数转换
fmt.Println(string('b') )
Printf 和 Println 的区别
printf 输出后不换行， println输出后自动换行；
printf格式化输出，println 直接输出内容
```

### 6、跨平台编译

> `GO`代码可以跨平台编译
>
> 只需要指定对应目标操作系统的平台和处理器架构就可以了

#### 6.1 mac编译linux程序

```bash
# 编译linux程序64位
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

# 编译windows程序64位
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
```

#### 6.2 linux编译mac和windows程序

```bash
# 编译mac程序64位
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build

# 编译windows程序64位
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
```

#### 6.3 windows下编译mac程序

```bash
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build
```

## 三、变量与常量

### 1、第一行代码解释

```go
// 这里是指声明的包
// main包表示可以编译执行的二进制文件
// 非main包表示是给别人用的
package main

// 引入一个fmt包，用来提供打印功能
// 引入的包必须是双引号
import "fmt"

// 在函数外只能放置标识符(变量、常量、函数、类型)的声明，不可以放语句
// 语句比如: a + b = c

// main包必须有一个main函数，是整个程序的入口，所有代码都从main函数里进行执行
// main函数没有参数，也没有返回值
func main() {
	fmt.Println("hello, go!")
}
```

### 2、标识符/关键字

#### 2.1 标识符

> 表示定义的具有特殊意义的单词，比如变量名、常量名、函数名等等
>
> `GO`中由字母、数字、下划线(_)组成

#### 2.2 关键字

> 编程语言内部定义好的关键字
>
> 比如：`import`、`break`等

### 3、变量

> `GO`语言中的需要先声明再使用
>
> `GO`语言的变量是静态类型，所以需要定义类型

```go
// 格式
var 变量名 变量类型

// 变量声明推荐使用小驼峰
var isMyName string
```

#### 3.1 声明变量

> 单独声明变量

```go
// 如下,声明一个保存字符串类型的变量
var s1 string 

// 整型
var num int

// 布尔类型
var ret bool
```

#### 3.2 批量声明

> 声明变量后会有一个初始值

```go
// go可以批量声明变量

var (
	name string // ”“
  age int // 0
  isOk bool // false
)
```

#### 3.3 变量默认值

> 字符串类型初始值为`""`
>
> 整型类型初始值为0
>
> 布尔类型初始值为`false`
>
> 

```go
package main

import "fmt"

var (
	name string
	age int
	isOk bool
)

func main() {
	// 先声明变量有一个默认值
	fmt.Println(name) // ""
	fmt.Println(age) // 0
	fmt.Println(isOk) // false

	// 重新初始化赋值变量
	name = "sam"
	age = 18
	isOk = true
	fmt.Println(name) // sam
	fmt.Println(age) // 18
	fmt.Println(isOk) // true
}
```

#### 3.4 注意点

> 需要注意的是`GO`语言中变量声明必须使用，不使用就编译不过去
>
> - 这里需要注意的是全局变量可以声明但不使用，在函数外面使用`var`声明的变量
> - 非全局变量声明后赋值且必须使用，在函数内声明变量
>
> 因为编译器会减少编译后的体积，所以声明了变量但未使用就会编译不通过
>
> `GO`语言没有什么缩进格式要求，当然好的代码格式是比较方便阅读的

#### 3.5 三种声明方式

> `var`  变量声明，可以适用于函数内外 
>
> `:=`  短变量声明，只能在函数内声明
>
> `_`  多用于占位，表示忽略某个值
>
> 同一个作用域不可重复声明同名的变量
>
> - 一个花括号就是一个作用域

```GO
package main

import "fmt"

// 函数声明外面属于全局变量
var s1 string = "lolp"

func main() {
	// 方式一：声明变量同时赋值
	var name string = "lily"
	fmt.Println(name) // lily

	// 方式二：类型推导: 根据值判断时什么类型
	var s2 = "sam"
	fmt.Println(s2) // sam

	// 方式三：短变量声明：只能在函数内声明
	s3 := "bob"
	fmt.Println(s3) // bob
  
  // 重复声明s3就会报错
  // no new variables on left side of :=
  s3 := "alex" 
}
```

#### 3.6 匿名变量

> 如果想要忽略某个值，可以使用匿名变量，匿名变量使用一个下划线`_`表示
>
> 匿名变量不占用命名空间，不会分配内存，所以匿名变量之间不存在重复声明
>
> 匿名变量适用于批量声明变量

#### 3.7 打印变量

```go
// 输出变量自动换行
fmt.Println("Hi，go")
// 格式化输出变量
fmt.Printf("Hi，%d", age)
// 输出变量但没有换行符
fmt.Print("Hi，go")
```

### 4、常量

> 程序运行期间固定不变的值

#### 4.1 常量声明

```go
package main

import "fmt"

// 常量是指程序运行期间永不变的值
// 并且常量定义后不能重新赋值
const pi = 3.1415926

func main() {
	fmt.Println(pi)
}
```

#### 4.2 批量声明

```go
package main

import "fmt"

// 批量声明
const (
	CODE_OK = 200
	CODE_NOT_FOUND = 404
)

// 批量声明变量，如果后面没写值就和上一行一样的值
const (
	n1 = 100
	n2
	n3
)


func main() {
	fmt.Println(CODE_OK) // 200
	fmt.Println(CODE_NOT_FOUND) // 404

	// <--->
	fmt.Println(n1) // 100
	fmt.Println(n2) // 100
	fmt.Println(n3) // 100
}
```

#### 4.3 iota

> `iota`是常量计数器
>
> `const`中每新增一行常量声明，将使`iota`的计数加一，初始的`iota`值为0

```go
package main

import "fmt"

//批量声明变量，如果后面没写值就和上一行一样的值
const (
	n1 = iota // 0
	n2        // 1
	n3        // 2
)


const (
	b1 = iota // 0
	b2        // 1
	_         // 2 匿名变量表示不需要这个值，可以丢弃掉
 	b3        // 3
)

func main() {
	fmt.Println(n1) // 0
	fmt.Println(n2) // 1
	fmt.Println(n3) // 2
	// ----
	fmt.Println(b1) // 0
	fmt.Println(b2) // 1
	fmt.Println(b3) // 3
}
```

#### 4.4 iota的几种场景

> `iota`的核心: 每新增一行常量声明，将使`iota`的计数加一
>
> 并且`const`重新出现`iota`才会置为0

```go
package main

import "fmt"

// iota插队: `const`中每新增一行常量声明，将使`iota`的计数加一，
const (
	b1 = iota
	b2 = 100 // 表示在const中新增一行，并且是在同一个const中
 	b3 = iota
)

// 多个常量声明在一行
const (
	// d1和d2在同一行，所以iota是0，所以d1:0 + 1 = 1, d2: 0 + 2 = 2
	d1, d2 = iota + 1, iota + 2

	// d1和d2在同一行，所以iota是0，所以d3:1 + 1 = 2, d4: 1 + 2 = 3
	d3, d4 = iota + 1, iota + 2
)


func main() {
	fmt.Println(b1) // 0
	fmt.Println(b2) // 1
	fmt.Println(b3) // 2

	// <--->
	fmt.Println(d1) // 1
	fmt.Println(d2) // 2
	fmt.Println(d3) // 2
	fmt.Println(d4) // 3
}
```

#### 4.5 定义数量集

```go
package main

import "fmt"

// 定义数量集
// << 表示左移符号，向左移动几位
const (
	_ = iota
	KB = 1 << (10 * iota) // 表示向左移动10位，也就是2的10次方，转换为二进制就是1024
	MB = 1 << (10 * iota)
	GB = 1 << (10 * iota)
	TB = 1 << (10 * iota)
)

func main() {
	fmt.Println(KB) // 1024
	fmt.Println(MB) // 1048576
}
```

## 四、数据类型

### 1、整型

> 





































