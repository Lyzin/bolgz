## 一、GO语言简介与配置

### 1、Go包的官方地址

> 官网：[https://golang.org/dl/](https://golang.org/dl/)
>
> 国内镜像站：[https://golang.google.cn/dl](https://golang.google.cn/dl)
>
> 流程图地址：[https://app.diagrams.net/](https://app.diagrams.net/)
>
> [golang内置库文档](https://studygolang.com/pkgdoc)

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

### 3、学习心得

> 使用`golang Idea`编辑器或`vs code`，但是不要开启自动提示功能，使用省电模式，因为一开始就自己手写所有语法才能记得住
>
> 本笔记代码建议是`缩进4个空格`，但笔记代码缩进有可能不是2格，写代码时需要注意！

### 4、GO版本

![image-20211026110955968](go%E7%AC%94%E8%AE%B0.assets/image-20211026110955968.png)

### 5、GOPATH

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

### 6、MAC配置自定义GOPATH

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

#### 6.1 创建目录

- 创建go目录以及那三个目录

![image-20211026113846716](go%E7%AC%94%E8%AE%B0.assets/image-20211026113846716.png)

#### 6.2 添加环境变量

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

#### 6.3 查看GOPATH

> 1. 重新查看`GOPATH`，可以看到`GOPATH`已经修改过来了

![image-20211026114200717](go%E7%AC%94%E8%AE%B0.assets/image-20211026114200717.png)

### 7、Windows配置GOPATH

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

#### 7.1 修改自己的GOPATH值

> 在存放`go`代码的位置创建目录，将对应的目录地址填写过来

![image-20211103004455355](go%E7%AC%94%E8%AE%B0.assets/image-20211103004455355.png)

#### 7.2 修改`GOPATH\bin`

> 需要在`PATH`这个环境变量修改，修改成：`%GOPATH%\bin`，表示进到在上面设置的`GOPATH`的`bin`目录下

![image-20211103004636063](go%E7%AC%94%E8%AE%B0.assets/image-20211103004636063.png)

#### 7.3 检查`GOPATH`

> 看到已经修改过来了

![image-20211103004908553](go%E7%AC%94%E8%AE%B0.assets/image-20211103004908553.png)

### 8、创建代码目录

> 按照上述说明的进行创建目录

![image-20211026115327001](go%E7%AC%94%E8%AE%B0.assets/image-20211026115327001.png)

## 二、运行代码

### 1、第一行代码

> 代码注释:
>
> ```go
> // 单行注释
> 
> /*
> 多行注释
> 多行注释
> 多行注释
> */
> ```

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

### 5、单引号与双引号

> - 在`go`语法中，双引号是常用的来表达字符串，如果你使用了单引号，编译器会提示出错
>   - `invalid character literal (more than one character)`
>   - 这个报错提示了无效的字符字面，超过了一个字符，因为字符串一般是大于一个字符的数量的字符串
>     - 单引号只能包含一个字符，例如`'b'` ，程序会输出`98`表示字符`b`的`ascii`码
>     - `ascii`码是用数字对应字母的

> - 如果非要使用单引号输出必须使用string函数转换,如下

```go	
fmt.Println(string('b'))
```

> `Printf`和`Println`的区别
>
> `Printf`输出后不换行,`Println`输出后自动换行
> `Printf`格式化输出,`Println`直接输出内容

### 6、跨平台编译代码

> `GO`代码可以跨平台编译
>
> 只需要指定对应目标操作系统的平台和处理器架构就可以了

#### 6.1 `mac`编译`linux`程序

```bash
# 编译linux程序64位
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

# 编译windows程序64位
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
```

#### 6.2 `linux`编译`mac`和`windows`程序

```bash
# 编译mac程序64位
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build

# 编译windows程序64位
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
```

#### 6.3 `windows`下编译`mac`程序

```bash
set CGO_ENABLED=0 set GOOS=darwin set GOARCH=amd64 go build
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
> `Go`中由字母、数字、下划线(_)组成

#### 2.2 关键字

> 编程语言内部定义好的关键字
>
> 比如：`import`、`break、func`等等

### 3、变量声明

> `GO`语言中的变量是静态类型，需要先声明再使用

#### 3.1 变量声明的几种方式

##### 3.1.1  `var`关键字

###### 1、声明变量不赋值

> - 适用于任何地方来声明变量，比如函数外，函数内，适合声明全局变量
> - 这种方式声明变量会有默认值，常见的如下
>   - 字符串类型初始值为`""`
>   - 整型类型初始值为0
>   - 布尔类型初始值为`false`
> - 变量名不可以重复声明
>
> ```go
> // 变量声明格式
> var 变量名 变量类型
> 
> // 变量声明推荐使用小驼峰
> var isMyName string
> 
> // 声明后给变量赋值
> name = "sam"
> age = 18
> isOk = true
> ```

###### 2、声明变量的同时赋值

> - 适用于任何地方来声明变量，比如函数外，函数内，适合声明全局变量
> - 并且变量的值就是赋值的值
>
> ```go
> // 变量声明推荐使用小驼峰
> var isMyName string = "sam"
> ```

###### 3、自动推导变量类型

> - 这种方式不需要指定变量类型，直接赋值即可，`go`会自动推导出变量类型
> - 适用于任何地方来声明变量，比如函数外，函数内，适合声明全局变量，不过为了能够清楚看出变量是什么类型，还是指定变量类型比较好
>
> ```go
> // 变量声明推荐使用小驼峰
> var isMyName = "sam"
> ```

###### 4、批量声明变量

> - 因式分解形式来声明变量后会有一个初始值，也是批量声明变量
>
> - 格式
>
> ```go
> var (
> 	变量名 类型
>   	变量名 类型
>   	变量名 类型
> )
> ```
>
> - 注意点：
>
> ```go
> // 使用批量声明变量必须指定变量类型，否则会报错
> // 需要指定期望的变量类型
> syntax error: unexpected newline, expecting type
> ```

###### 5、一行声明多个变量

> - 可以使用var关键字一行声明变量，但是必须指定变量类型
> - 格式
>
> ```go
> var 变量a,变量b,变量c,变量d 变量类型
> ```
>
> - 注意点
>
> ```go
> // 使用批量声明变量必须指定变量类型，否则会报错
> // 需要指定期望的变量类型
> syntax error: unexpected newline, expecting type
> ```

##### 3.1.2 短变量声明

> - `go`语言中可以使用短变量声明方式进行声明变量，会自动推到变量类型
>
> - 格式
>
> ```go
> 变量名 := 变量值
> ```
>
> - 注意
>
> ```go
> // 这种方式只适用于函数体内，如果在函数体外定义，就会报错
> // 提示不能在函数体外声明变量
> non-declaration statement outside function body
> ```

```go
// 如下，短变量声明
sf := "sf"
```

#### 3.2 注意点

> - 变量声明注意点
>   - `var`  变量声明，可以适用于函数内外 
>   - `:=`  短变量声明，只能在函数内声明
>   - `_`  匿名变量多用于占位，表示忽略某个值
>   - 同一个作用域不可重复声明同名的变量
>
> - 一个花括号就是一个作用域
>   - 需要注意的是`Go`语言中变量声明必须使用，不使用就编译不过去
>   - 这里需要注意的是全局变量可以声明但不使用，在函数外面使用`var`声明的变量
>   - 非全局变量声明后赋值且必须使用，在函数内声明变量
>
> - 因为编译器会减少编译后的体积，所以声明了变量但未使用就会编译不通过
>
>
> - `Go`语言没有什么缩进格式要求，当然好的代码格式是比较方便阅读的

### 4、匿名变量

> 匿名变量可以想象成linux中的标准输入，表示我不需要查看该输出，相当于忽略
>
> 如果想要忽略某个值，可以使用匿名变量，匿名变量使用一个下划线`_`表示
>
> 匿名变量不占用命名空间，不会分配内存，所以匿名变量之间不存在重复声明
>
> 匿名变量适用于批量声明变量

```go
package main

import "fmt"

const (
	a1 = 100
	a2
	_   // 这里就代表将这个值以匿名变量跳过
	a3 = iota
)

func main() {
    fmt.Println("第一个批量定义常量")
    fmt.Printf("%v\n", a1)
    fmt.Printf("%v\n", a2)
    fmt.Printf("%v\n", a3)
}
```

### 5、常量

> 程序运行期间固定不变的值
>
> 推荐在函数外部进行声明
>
> 常量声明以后不可以再重新赋值

#### 5.1 常量声明

```go
package main

import "fmt"

// 常量是指程序运行期间永不变的值
const pi = 3.1415926

func main() {
		fmt.Println(pi)
}
```

```go
// 并且常量定义后不能重新赋值
package main

import "fmt"

const pi = 3.1

func main() {
    pi = 45  // 对常量进行重复赋值
    fmt.Printf("%v\n", pi)
}
// 输出报错如下图
// 翻译过来就是不能指定给pi，已声明未const
```

![image-20211206141410106](go%E7%AC%94%E8%AE%B0.assets/image-20211206141410106.png)

#### 5.2 批量声明

> 因式分解形式进行批量声明常量
>
> 批量声明变量，如果后面没写值就和上一行一样的值

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
    n3 = 300
    n4
)
func main() {
    fmt.Println(CODE_OK) // 200
    fmt.Println(CODE_NOT_FOUND) // 404

    // <--->
    fmt.Println(n1) // 100
    fmt.Println(n2) // 100
    fmt.Println(n3) // 300
    fmt.Println(n4) // 300
}
```

#### 5.3 `iota`

> `iota`是常量计数器，只能在`conts`常量中使用
>
> - `const`中每新增一行常量声明，将使`iota`的计数加一，初始的`iota`值为0
>   - 这里要注意当批量声明`const`时，如果第一个常量没有显式的写值等于`iota`，当下面的`x`常量值写了等于`iota`,那么该x常量的值就是`iota`从`0`开始到这个`x`的值,而不是从`0`开始，因为`iota`也说明了只要`const`中新增一行，`iota`就会加一

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

#### 5.4 iota的几种场景

> - `iota`的核心:
>  - 每新增一行常量声明，将使`iota`的计数加一
>   - 并且`const`重新出现`iota`才会置为0

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

### 6、`fmt `包使用总结

> 常用的fmt包输出格式：
>
> - `%v`:是万能输出变量的值，任何类型变量都可以输出
> - `%#v`:输出变量并且与变量的类型
> - `%T`:查看变量的类型
> - `%s`:输出字符串
> - `%d`:输出数字
> - `%p`:输出内存地址
>   - `fmt.Printf("%p\n", &name)`

```go
package main

import "fmt"

func main() {
    s1 := 100
    // 查看变量的类型
    fmt.Printf("%T\n", s1) // int

    // 查看变量的值，任何类型都可以看
    fmt.Printf("%v\n", s1) // 100

    // 输出整型的值
    fmt.Printf("%d\n", s1) // 100

    // 将10进制转换为2进制
    fmt.Printf("%b\n", s1) // 1100100

    // 将10进制转换为8进制
    fmt.Printf("%o\n", s1) // 144

    // 将10进制转换为16进制
    fmt.Printf("%x\n", s1) // 64

    // 输出字符,常用与for循环内输出每个元素值
    fmt.Printf("%c\n", s1)

    s2 := "bob"
    // 输出字符串的值
    fmt.Printf("%T\n", s2) // string
    fmt.Printf("%s\n", s2) // bob
    fmt.Printf("%#v\n", s2) // "bob" 即输出了值，也输出了类型
}
```



## 四、数据类型

### 1、整型

> 整型分为以下两个大类，按长度分为：
>
> - 有符号整型：`int8、int16、int32、int64` 
>
> - 对应的无符号整型：`uint8、uint16、uint32、uint64`
>
> 其中，`uint8`就是我们熟知的`byte`型，`int16`对应C语言中的`short`型，`int64`对应C语言中的`long`型。

```go
package main

import "fmt"

func main() {
    // 定义整型变量
    i1 := 101
    fmt.Printf("%d\n", i1) // 表示输出10进制数, 101
    fmt.Printf("%b\n", i1) // 10进制转换为2进制, 1100101
    fmt.Printf("%o\n", i1) // 10进制转换为8进制, 145
    fmt.Printf("%x\n", i1) // 10进制转换为16进制, 65

    // 八进制,表示0-7的数字，一般以0开头，用于文件权限
    i2 := 077
    fmt.Printf("%d\n", i2) // 表示将8进制转换为10进制，63

    // 十六进制，表示0-f的值，一般以0x开头,用于内存地址
    i3 := 0x1234567
    fmt.Printf("%d\n", i3) // 表示将16进制转换为10进制，19088743

    // 声明int8的类型,指定数字为什么类型，否则就是int类型
    i4 := int8(9)
    fmt.Printf("%d\n", i4) // 9
    fmt.Printf("%T\n", i4) // int8
}
```

### 2、浮点数

> 1、Go语言支持两种浮点型数：`float32`和`float64`
>
> 2、这两种浮点型数据格式遵循`IEEE 754`标准：
>
> -  `float32` 的浮点数的最大范围约为 `3.4e38`，可以使用常量定义：`math.MaxFloat32`
> - `float64` 的浮点数的最大范围约为 `1.8e308`，可以使用一个常量定义：`math.MaxFloat64`
>
> 3、打印浮点数时，可以使用`fmt`包配合动词`%f`
>
> 4、默认`Go`语言的小数都是`float64`
>
> 5、`float32`的变量值不能赋值给`float64`位

```go
package main
import (
	"fmt"
	"math"
)

func main() {
    fmt.Printf("%f\n", math.Pi) // 3.141593
    // %.2f 表示保留小数点后两位
    fmt.Printf("%.2f\n", math.Pi) // 3.14
    fmt.Printf("%T\n", math.Pi) // float64

    // 定义float32类型
    s2 := float32(1.3245)
    fmt.Printf("%f\n", s2) // 1.324500
    fmt.Printf("%T\n", s2) // float32
}
```

### 3、布尔值

> Go语言中以`bool`类型进行声明布尔型数据，布尔型数据只有`true（真）`和`false（假）`两个值。
>
> **注意：**
>
> 1. 布尔类型变量的默认值为`false`。
> 2. Go 语言中不允许将整型强制转换为布尔型。
> 3. 布尔型无法参与数值运算，也无法与其他类型进行转换。

```go
package main

import "fmt"

func main() {
    var s1 bool // 只声明布尔值不赋值，默认值是false
    s2 := true
    fmt.Printf("%T\n", s1) // bool
    fmt.Printf("%T\n", s1) // bool
    fmt.Printf("%v\n", s1) // false
    fmt.Printf("%v\n", s2) // true
}
```

### 4、字符串

> `Go`语言中的字符串以原生数据类型出现，使用字符串就像使用其他原生数据类型（int、bool、float32、float64 等）一样
>
> `Go`语言里的字符串的内部实现使用`UTF-8`编码
>
> 字符串的值为`双引号(")`中的内容
>
> `Go`语言中字符串必须是双引号`(")`，单引号`(')`表示字符
>
> `golang`中`string`底层是通过`byte数组`实现的
>
> 中文字符在`unicode`下占`2个字节`，在`utf-8编`码下占`3个字节`，而`golang`默认编码正好是`utf-8`,所以一个中文表示3个字符

#### 4.1 字符串

```go
package main

import "fmt"

func main() {
    // 字符串
    s1 := "hello"
    fmt.Printf("%T\n", s1) // string
    fmt.Printf("%#v\n", s1) // hello

    // 单独的字母，汉字、符号表示一个字符
    s2 := 'h'
    s3 := 'e'
    fmt.Printf("%T\n", s2) // int32
    fmt.Printf("%v\n", s2) // 104
    fmt.Printf("%v\n", s3) // 101

    // 字节: 1字节=8bit(8个二进制位)
    // 1个字符'A'等于1个字节
    // 1个utf8编码的汉字'沙' 一般占3个字节
}
```

#### 4.2 转义符号

```go
`\r	回车符（返回行首）
\n	换行符（直接跳到下一行的同列位置）
\t	制表符
\'	单引号
\"	双引号
\\	反斜杠`
```

```go
package main

import "fmt"

func main() {
	path := "\"D:\\Go\\src\\code.xx.name\\day01\""
	fmt.Printf("%v\n", path) // "D:\Go\src\code.xx.name\day01"
}
```

#### 4.3 多行字符串

> 输出多行字符串，需要使用反引号，在`esc`键位下方的按键
>
> 反引号的内容会原样输出，可以用来输出文件路径

```go
package main

import "fmt"

func main() {
	s1 := `this is
	a
	good
	day!
	`
	fmt.Printf("%v\n", s1)
	fmt.Printf("%#v\n", s1)
}
```

#### 4.4 字符串长度

> `len(str)`返回一个`int`型

```go
package main

import "fmt"

func main() {
	s1 := "hi, go~"
	fmt.Printf("%v\n", len(s1)) // 7
}
```

#### 4.5 字符串拼接

> 返回一个新的字符串变量

```go
package main

import "fmt"

func main() {
	s2 := "good"
	s3 := " day"
	// 拼接法1： +号
	s4 := s2 + s3
	fmt.Printf("%v\n", s4) // good day
	
	// 拼接法2：使用fmt包的Sprintf接收两个变量值然后拼接后返回给一个变量
	s5 := fmt.Sprintf("%s%s", s2, s3)
	fmt.Printf("%v\n", s5) // good day
}
```

#### 4.6 分割

> 需要引入包`strings`
>
> 分割后返回值为一个`list`

```go
package main

import "fmt"
import "strings"

func main() {
	s1 := "hi\\go\\haha"
	s2 := strings.Split(s1, "\\")
	fmt.Printf("%v\n", s2) // [hi go haha]
}
```

#### 4.7 包含

> 返回值是`true/false`

```go
package main

import "fmt"
import "strings"

func main() {
	s1 := "hi\\go\\haha"
	
	// 包含
	s2 := strings.Contains(s1, "go")
	fmt.Printf("%v\n", s2) // true
	
	// 不包含
	s3 := strings.Contains(s1, "gos")
	fmt.Printf("%v\n", s3) // false
}
```

#### 4.8 前缀/后缀

> 返回值是`true/false`

```go
package main

import "fmt"
import "strings"

func main() {
	s1 := "hi\\go\\haha"

	// 判断前缀是否是以hi开头
	s2 := strings.HasPrefix(s1, "hi")
	fmt.Printf("%v\n", s2) // true

	// 判断后缀是否是以gos结尾
	s3 := strings.HasSuffix(s1, "gos")
	fmt.Printf("%v\n", s3) // false
}
```

#### 4.9 子串位置

> 返回子串的索引位置

```go
package main

import "fmt"
import "strings"

func main() {
	s1 := "hi\\go\\haha"

	// 返回子串的第一个字符出现的索引位置
	s2 := strings.Index(s1, "hi")
	fmt.Printf("%v\n", s2) // 0

	// 返回子串最后一个字符出现的索引位置
	s3 := strings.LastIndex(s1, "go")
	fmt.Printf("%v\n", s3) // 3
}
```

#### 4.10 join

> `join`可以将数组以某个格式拼接起来，比如：`-`、`+`等

```go
package main

import "fmt"
import "strings"

func main() {
	// 先将字符串切割为数组
	s1 := "hi\\go\\haha"
	s2 := strings.Split(s1, "\\")
	// 再将数组join连接成字符串
	s3 := strings.Join(s2, "+")
	fmt.Printf("%v\n", s3) // hi+go+haha
}
```

#### 4.11 字符串修改

> 首先字符串不可以修改，不过可将字符串修改为其他类型再进行修改
>
> 将字符串先转换为一个切片，切片里保存的就是字符
>
> 然后对切换的字符进行重新赋值后再输出就达到了字符串修改
>
> `rune`类型是`int32`类型的
>
> `byte`是`uint8`类型的

```go
package main

import "fmt"

func main() {
	s2 := "白萝卜"
	s3 := []rune(s2) // 把字符串强制转换成了一个rune切片,切换里保存的就是字符
	s3[0] = '红'
	s4 := string(s3)
	fmt.Printf("%v\n", s4) // 红萝卜
}
```

#### 4.12 强制类型转换

```go
package main

import "fmt"

func main() {
	// 类型转换
	// 整型和浮点型转换
	s1 := 10
	s2 := float64(s1)
	fmt.Printf("%v\n", s2) // 10
	fmt.Printf("%T\n", s2) // float64
}
```

### 5、rune类型

> - rune is an alias for int32 and is equivalent to int32 in all ways. It is used, by convention, to distinguish character values from integer values
> - int32的别名，几乎在所有方面等同于int32，它用来区分字符值和整数值

```go
type rune = int32
```

```go
package main

import "fmt"

func main() {
	
	var str = "hello 你好"
	fmt.Println("len(str):", len(str)) // 12
	
}
```

> - 结果是12
>   - 因为`go`是`utf-8`编码，而`go`底层字符串是用`byte`编码的，一个汉字表示3个字符
>   - 所以`str`的长度是`hello(5个字符)`+`空格(1个字符)`+`你好(6个字符)`=`12个字符`

## 五、流程控制

### 1、if语句

> 常见的`if`判断语句
>
> 格式：
>
> ```go
> if 表达式 {
>   	语句1
> } else {
>   	语句2
> }
> ```

#### 1.1 单个if语句

```go
package main

import "fmt"

func main() {
	// 类型转换
	// 整型和浮点型转换
	s1 := 10
	if s1 == 10 {
		fmt.Printf("s1 等于 %v\n", s1)
	} else {
		fmt.Printf("s1 不等于 %v\n", s1)
	}
}

// 输出结果
// s1 等于 10
```

#### 1.2 嵌套if语句

> 格式：
>
> ```go
> if 表达式 {
>   	语句1
> } else if 表达式 {
>   	语句2
> } else {
>   	语句3
> }
> ```

```go
package main

import "fmt"

func main() {
	// 类型转换
	// 整型和浮点型转换
	s1 := 10
	if s1 > 10 {
			fmt.Printf("s1 大于 %v\n", s1)
	} else if s1 < 10 {
			fmt.Printf("s1 小于 %v\n", s1)
	} else {
			fmt.Printf("s1 等于 %v\n", s1)
	}
}
```

#### 1.3 特殊写法

> 可以将变量写到if判断里，以减少内存占用
>
> 并且在if语句外是无法访问到if里的变量值

```go
package main

import "fmt"

func main() {
	// 将变量和if写在一行，这个s1变量的作用域只在if判断里生效，if判断外无法进行变量访问
	// 这样可以减少内存占用
	if s1 := 10; s1 == 10 {
			fmt.Printf("s1 等于 %v\n", s1)
	} else {
			fmt.Printf("s1 不等于 %v\n", s1)
	}
	
	// 在这里是没法访问到s1的，因为s1在if的作用域里
	fmt.Printf("%v\n", s1) // undefined: s1
}
```

### 2、for语句

#### 2.1 基础格式

> 格式：
>
> ```go
> for 初始语句;条件表达式;结束语句{
>     		循环体语句
> }
> ```

```go
package main

import "fmt"

func main() {
	for i:= 0; i < 10; i++{
			fmt.Printf("%v\n", i)
	}
}

// 结果
/*
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
*/
```

#### 2.2 `for`变种1

> 将初始值提到`for`循环外面

```go
package main

import "fmt"

func main() {
	i := 5
	for ;i < 10; i++{
			fmt.Printf("%v\n", i)
	}
}

// 结果
/*
    5
    6
    7
    8
    9
*/
```



#### 2.3 `for`变种2

> 将初始值提到`for`循环外面
>
> 将结束语句放到`for`循环内部

```go
package main

import "fmt"

func main() {
	i := 5
	for i < 10{
			fmt.Printf("%v\n", i)
			i++
	}
}

// 结果
/*
    5
    6
    7
    8
    9
*/
```

#### 2.4 无限循环

> 切记不要轻易尝试，这是死循环，`go`性能很高，很容易将机器性能打满
>
> 死循环代码格式
>
> ```go
> for {
> 	循环语句
> }
> ```

```go
for {
		fmt.Println("hello world")
}
```

> 当前也可以给`for`后面跟条件判断语句,有点类似于其他语言的`while`语句，达成某种条件后退出循环

```go
package main

import "fmt"

func main() {
	s := 0
	for s < 3 {
		fmt.Printf("这是for循环\n")
		s++
	}
}

// 输出结果为三个for循环结果
/*
这是for循环
这是for循环
这是for循环
*/
```



### 3、`for range`循环

#### 3.1 基础格式

> - `Go`语言中可以使用`for range`遍历数组、切片、字符串、`map`及通道（`channel`），通过`for range`遍历的返回值有以下规律：
>   - 数组、切片、字符串返回索引和值
>   - `map`返回键和值
>   - 通道（`channel`）只返回通道内的值
>
> - `for`循环中输出每个字符，那必须使用`%c`来输出字符

> 代码格式

```go
// 这里面的i是循环的索引值
// v是值

s := "Hello测几"
for i, v := range s {
	fmt.Printf("%d : %c",i, v)
} 
```

```go
package main

import "fmt"

func main() {
	// for range 循环
	s := "Hello悦悦"
	for i, v := range s {
		if i < 1 {    
			fmt.Printf("%d\n", i)  // 索引值 0
			fmt.Printf("%T\n", v)  // int32 ,所以需要转换成字符类型
			fmt.Printf("%c\n", v)  // H
		}
	}
}
```

#### 3.1 只有一个变量

> 当`for range`中只有一个变量时，那这个变量是索引值而不是元素值

```go
fmt.Println("for range 只有一个变量")
	for v := range rangeNameStr {
		fmt.Println(v)
	}
```

#### 3.3 匿名变量接收索引值

> 在`3.2`中描述只有一个变量时，这个变量是索引值而不是元素值，当不想要索引值时，可以使用匿名变量来接收索引值
>
> 这里就是匿名变量的用处，可以作为一个

```go
fmt.Println("for range 使用匿名变量接收索引")
for _, v := range rangeNameStr {
    fmt.Printf("%c", v)
}
```

### 4、`for`循环例子

> 9x9乘法口诀

```go
package main

import "fmt"

func main() {
	for i := 1; i < 10; i++ {
		for j := 1; j <= i; j++ {
			z := i * j
			fmt.Printf("%d * %d = %d\t ", i, j, z)
		}
		fmt.Println()
	}
}
```

### 5、break

> `break`用来表示直接退出循环

```go
package main

import "fmt"

func main() {
	for i := 1; i < 10; i++ {
		if i == 5 {
			break
		} else {
			fmt.Printf("i = %d\n", i)
		}
	}
	fmt.Print("done")
}

// 结果
i = 1
i = 2
i = 3
i = 4
i = 5
// 可以看到等于5就退出循环了
```

### 6、continue

> 跳过这一次循环

```go
package main

import "fmt"

func main() {
	for i := 1; i < 10; i++ {
		if i == 5 {
			continue
		} else {
			fmt.Printf("i = %d\n", i)
		}
	}
	fmt.Print("done")
}

// 结果,可以看到5被跳过不输出
/*
    i = 1
    i = 2
    i = 3
    i = 4
    i = 6
    i = 7
    i = 8
    i = 9
*/
```

### 7、switch

> 主要是简化大量判断
>
> 当大量`if`需要判断某个变量等于某个值，然后执行一些功能块时，就可用`switch`语句来简化代码
>
> `switch`和`case`两个关键字是同一列，不需要`case`在`switch`下缩进

```go
package main

import "fmt"

func main() {
    // 多个if判断可以使用switch语句
    age := 18
    if age == 1 {
      fmt.Println("age = 1")
    } else if age == 2 {
      fmt.Println("age = 2")
    } else {
      fmt.Println("age = 3")
    }

    // switch简化大量判断
    switch age {
    case 1:
      fmt.Println("age = 1")
    case 2:
      fmt.Println("age = 2")
    default:
      fmt.Println("age not found")
    }
}
```

#### 7.1 `switch`变种

> 可以在`swicth`语句的`case`里放置多个值

```go
package main

import "fmt"

func main() {
    // 多个if判断可以使用switch语句
    age := 8

    // switch的case可以放置多个值
    switch age {
    case 1, 3, 5, 7, 9:
    	fmt.Println("age = 1")
    case 2, 4, 6, 8, 10:
    	fmt.Println("age = 2")
    default:
    	fmt.Println("age not found")
    }
}

```

### 8、`goto`(了解)

> `goto`表示跳到某个位置，在代码里可以指定对应标签
>
> 建议：`goto`尽量少用

```go
package main

import "fmt"

func main() {
    // goto 语句，表示调到这个位置
    // goto 后面跟着标签Label，这可以直接跳出多个循环
    for i := 0; i < 10; i++ {
      if i == 3 {
      	  fmt.Printf("i = %d\n", i)
      	  goto LABEL_BREAK
      }
    }
    LABEL_BREAK:
    fmt.Println("done!")
}

```

## 六、运算符

### 1、算数运算符

> 常见的加减乘除余

```go
package main

import "fmt"

var (
    a int
    b int
    c int
)

func main() {
    a = 4
    b = 2
    // 加法
    fmt.Println(a + b) // 6

    // 减法
    fmt.Println(a - b) // 2

    // 乘法
    fmt.Println(a * b) // 8

    // 除法
    fmt.Println(a / b) // 2

    // 取余
    fmt.Println(a % b) // 0
}
```

### 2、递减与递增

> - 变量递增：`a++`
>   - 单独的语句， 不能放在=的右边赋值， 等价于：a = a + 1
>
> - 变量递减：`a--`
>   - 单独的语句， 不能放在=的右边赋值， 等价于：a = a - 1
>
> - 注意：
>   - 变量与`++`/`--`符号之间可以留一个空格，或者不留都可以进行递增或递减运算，个人建议可以不留空格

```go
package main

import "fmt"

func main() {
	fmt.Printf("--->\n")
	s1 := 10
	s1++
	fmt.Printf("%v\n", s1)
}
```

### 3、关系运算符

> 关系运算可以包含等于、不等于、大于等于、小于等于、大于、小于这几种关系
>
> 关系运算返回的一定是`bool`类型

```go
package main

import "fmt"

var (
    a int
    b int
    c int
)


func main() {
    a = 4
    b = 2

    // 关系运算符

    // 等于
    fmt.Println( a == b) // false

    // 不等于
    fmt.Println( a != b) // true

    // 大于等于
    fmt.Println( a >= b) // true

    // 小于等于
    fmt.Println( a <= b) // false

    // 大于
    fmt.Println( a > b) // true

    // 小于
    fmt.Println( a < b) // false
}

```

### 4、逻辑运算符

> 和其他语言一样，`go`语言可以进行多个逻辑判断

#### 4.1 与运算	

> `&& `表示与
>
> 两个条件都为真才为真

```go
package main

import "fmt"	

var (
    a int
    b int
    c int
)


func main() {
    a = 4
    b = 2

    // 与运算符
    if a > 3 && b < 3 {
        fmt.Println("aaa")
    } else {
        fmt.Print("bbb")
    }
}

```

#### 4.2 或运算

> `||`表示或运算
>
> 只要有一个条件为真则为真

```go
package main

import "fmt"

var (
    a int
    b int
    c int
)


func main() {
    a = 4
    b = 2

    // 或运算符
    if a > 3 || b < 3 {
      fmt.Println("aaa")
    } else {
      fmt.Print("bbb")
    }
}

```

#### 4.3 非运算

> `!`表示非，取反

```go
package main

import "fmt"

var (
    a int
    b bool
)

func main() {
    a = 4
    b = true

    // 或运算符
    if !b {
      fmt.Println("aaa")
    } else {
      fmt.Print("bbb")
    }
}
```

> 需要注意非运算只能跟布尔类型的值，其他的类型会报错
>
> 这个和其他语言是最不一样的地方，`python`中是可以对其他类型进行非运算判断

```go
package main

import "fmt"

func main() {
	s1 := 10
	s2 := "sam"
	if !s1 {
		fmt.Printf("不是10")
	} else if !s2 {
		fmt.Printf("不是10")
	}
}
```

![image-20211206161257244](go%E7%AC%94%E8%AE%B0.assets/image-20211206161257244.png)

### 5、位运算

> 针对的是二进制数

#### 5.1 按位与

> 符号：`&`
>
> 两位都为1才为1

```go
package main

import "fmt"

func main() {
	// 5的二进制： 101
	// 2的二进制：  10
	
	// 按位与 (两位都为1才为1)
	// 5的二进制数每一位和2的二进制的每一位进行运算
	// 5    1 0 1
	// 2      1 0
	// --------------
	//      0 0 0
	// 结果是3个0，那么
    // 0 X 2^2 + 0x2^1 + 0x2^0 = 0 + 0 + 0 = 0
    // 所以 5 & 2就是0
	fmt.Println(5 & 2) // 000
}
```

#### 5.2 按位或

> 符号: `|`
>
> 两位有一个为1就为1

```go
package main

import "fmt"

func main() {
	// 5的二进制： 101
	// 2的二进制：  10

	// 按位与 (两位有一个为1就为1)
	// 5的二进制数每一位和2的二进制的每一位进行运算
	// 5    1 0 1
	// 2      1 0
	// --------------
	//      1 1 1
	// 1 X 2^2 + 1x2^1 + 1x2^0 = 4 + 2 + 1 = 7
	fmt.Println(5 | 2) // 7
}
```

#### 5.3 按位异或

> 符号: `^`
>
> 两位不一样就为1

```go
package main

import "fmt"

func main() {
	// 5的二进制： 101
	// 2的二进制：  10

	// 按位异或 (两位不一样就为1)
	// 5的二进制数每一位和2的二进制的每一位进行运算
	// 5    1 0 1
	// 2      1 0
	// --------------
	//      1 1 1
	// 1 X 2^2 + 1x2^1 + 1x2^0 = 4 + 2 + 1 = 7
	fmt.Println(5 ^ 2) // 7
}
```

#### 5.4 左移

> 符号：`<<`
>
> 将二进制数往左移动指定的数字,移动后的空出来的位数由0补全

> 比如5的二进制： 101
>
> 将5往左位移动1位,相当于将5的二进制101整体往左移动一位，移动后空出来的位置由0补全，所以就变成了101 + 0 = 1010
>
> 详细计算见下

```go
package main

import "fmt"

func main() {
	// 5的二进制： 101
	// 往左移动1位, 变成了 1010
	// 5 << 1 等价于
	// 1 x 2^3 + 0 x 2^2 + 1 x 2^1 + 1 x 2^0 = 8 + 0 + 2 + 0 = 10
	fmt.Println(5 << 1) // 10

	// 往左移动2位, 变成了 10100
	// 5 << 2 等价于
	// 1 x 2^4 + 0 x 2^3 + 1 x 2^2 + 0 x 2^1 + 0 x 2^0  = 16 + 0 + 4 + 0 + 0 = 20
	fmt.Println(5 << 2) // 20

	// 往左移动3位, 变成了 101000
	// 5 << 2 等价于
	// 1 x 2^5 + 0 x 2^4 + 1 x 2^3 + 0 x 2^2 + 0 x 2^1 + 0 x 2^0  = 32 + 0 + 8 + 0 + 0 + 0 = 40
	fmt.Println(5 << 3) // 40
}
```

#### 5.5 右移

> 符号：`>>`
>
> 将二进制数往右移动指定的数字,相当于将二进制数从右边删除对应的位数，这样来看就相当于是往右边移动了

> 比如5的二进制： 101
>
> 将5往右位移动1位,相当于将5的二进制101整体往右减少一位，那么101右边减少一位就变成了10， 101最右边的1被减去了
>
> 详细计算见下

```go
package main

import "fmt"

func main() {
	// 5的二进制： 101

	// 往左移动1位, 变成了 10
	// 5 >> 1 等价于
	// 1 x 2^1 + 0 x 2^0 = 2 + 0 = 2
	fmt.Println(5 >> 1) // 2

	// 往左移动2位, 变成了 1
	// 5 >> 1 等价于
	// 1 x 2^0 = 1
	fmt.Println(5 >> 2) // 1

	// 往左移动3位, 变成了 0
	// 5 >> 1 等价于
	// 0 x 2^0 = 0
	fmt.Println(5 >> 3) // 0
	// 依次往下继续右移也会一直为0
	fmt.Println(5 >> 4) // 0
}
```

#### 5.5 左移与右移理解

> 类比在计算器上输入数字的例子，在计算器里输入数字:`23`
>
> - 想让23往左移动，那么就需要
>   - 左移一位，23后面补0，变为230
>   - 左移二位，230后面补0，变为2300
>   - 左移三位，2300后面补0，变为23000
>   - 这样来看屏幕就相当于把23往左移动了
>   - 当然也要注意，当定义的整数位数的长度不能被左移超过，如果超过也没什么意义
> - 想让23往右移动，那么就需要：
>   - 右移一位，23先把3删除，变为2
>   - 右移二位，2把自己删除，变为0
>   - 右移三位，0继续删除自己然后补0，所以会一直为0
>   - 这样来看屏幕就相当于把23往右移动了，有点类似于删除的感觉，当右移位数超过该值的位数，最终一直会为0

#### 5.6 左移与右移例子

> 可以用来定义数量集
>
> 这里的`<<`表示左移操作，`1<<10`表示将1的二进制表示向左移10位，也就是由`1`变成了`10000000000`，也就是十进制的1024
>
> 同理`2<<2`表示将2的二进制表示向左移2位，也就是由`10`变成了`1000`，也就是十进制的8
>
> 左移与右移常用于权限配置这一类设置

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

### 6、赋值运算符

> 给变量赋值
>
> `+=` 相加后再赋值
>
> `-=` 相减后再赋值
>
> `*=` 相乘后再赋值
>
> `/=` 相除后再赋值
>
> `%=` 求余后再赋值

```go
package main

import "fmt"

func main() {
	s1 := 13
	s1 += 1
	fmt.Printf("%v\n", s1) // 14

	s1 -= 1
	fmt.Printf("%v\n", s1) // 13
}
```

## 七、复合数据类型

### 1、数组

> 数组类似于其他语言的列表，比如`python`的`list`、`shell`语言的数组，但又完全不一样
>
> 常用来存储元素，元素是基本数据类型：字符串、整型、布尔值
>
> `一个数组只能指定一种数据类型，不支持一个数组中有多种数据类型的元素存在`
>
> - 注意
>   - `go`中的数组需要指定长度和类型
>   - 并且长度和元素类型是数组整个类型的一部分，这是和其他语言的不一样的地方
>
> - 数组使用场景不多，用的比较多的是切片

#### 1.1 数组声明

> - 数组声明
>   - 数组声明只是相当于定义了一个数组，并没有给数组指定具体的值，数组声明的所有元素值都是`go`语言中的零值
>   - 数组声明以后长度和类型都确定好了，不能再修改
>   - 数组只声明，不初始化，那这个数组每种类型的元素都有一个零值(默认值)，没有具体的值，默认零值如下
>     - 字符串类型初始值为`""`
>     - 整型类型初始值为`0`
>     - 布尔类型初始值为`false`

##### 1.1.1 `var`关键字声明数组

```go
// 格式
var 数组名 [数组长度]数组类型

// 数组名：定义的数组变量名
// 数组长度：一个具体的数字，可以为0，但是没有意义
// 数组类型：支持int/string/bool三种常见类型
```

```go
package main

import "fmt"

func main() {
	var arr1 [3]int
	var arr2 [3]string
	var arr3 [3]bool
	fmt.Printf("%v\n", arr1) // [0 0 0]

	// 可以看到arr1的类型不仅包含长度，还包含了元素类型
	fmt.Printf("%T\n", arr1) // [3]int

	fmt.Printf("%v\n", arr2) // [     ]
	fmt.Printf("%T\n", arr2) // [3]string

	fmt.Printf("%v\n", arr3) // [false false false]
	fmt.Printf("%T\n", arr3) // [3]bool
}
```

##### 1.2.1 短变量声明数组

> 除了`var`关键字声明数组，也可以用短变量方式声明数组
>
> - 短变量声明数组有两种格式
>   - 第一种：指定确定的数组长度值
>   - 第二种：用`...`代替确定的数组长度值，表示数组值的个数由go自动推导长度，这种方式声明的数组个数都是0

```go
数组名 := [数组长度]数组类型{}

/* 
	数组名：定义的数组变量名
	数组长度：一个具体的数字，可以为0，但是没有意义，必须是一个数字，不能是三个点
	数组类型：支持int/string/bool三种常见类型
	{} : 用短变量声明一定要有，不带会报错
*/
```

```go
package main

import "fmt"

func main() {
	// 方法1
	// 指定长度，此时该数组长度就是指定的长度
	s1 := [3]int{}
	fmt.Println(s1) // [0 0 0]
	fmt.Println(len(s1)) // 3
}
```

#### 1.2 数组初始化赋值

> 为什么要对数组初始化？
>
> - 定义完数组后，`go`会自动给数组元素设置初始的零值(默认值)，这应该不是我们想要的，所以要对数组已经设置的值进行重新赋值，所以需要初始化赋值，相当于覆盖了默认值
> - 数组定义以后每种类型的元素都有一个零值(默认值)
>   - 字符串类型初始值为`""`
>   - 整型类型初始值为`0`
>   - 布尔类型初始值为`false`
>
> 下面代码是初始化数组的三种方式
>
> - 初始化赋值方式
>   - 第一种：先声明，再初始化
>   - 第二种：短变量方式声明并且初始化，一步完成
>   - 第三种：根据索引来初始化，其他元素用零值(默认值)补全
>
> - 注意：
>   - 其实数组不管哪种方式声明并且初始化赋值
>     - 既可以分步骤执行，先声明，再初始化完成
>     - 也可以声明和初始化赋值在一行代码完成
>     - 使用哪种方式取决于自己
>   - 用短变量方式直接定义数组，但是必须要对数组进行初始化(也就是要一定带上{}符号，表示创建了一个数组)，否则会下面的错误
>     - 错误提示：`./main.go:7:8: type []int is not an expression`

##### 1.2.1 `var`初始化赋值

> 推荐使用：
>
> - 通过`var`关键字需要分两步
>   - 先声明
>   - 再初始化赋值数组

```go
package main

import "fmt"

func main() {
	// 声明数组
	var arr1 [3]int
	fmt.Println(arr1) // [0 0 0]

	// 数组初始化赋值
	arr1 = [3]int{1, 2, 3}
	fmt.Println(arr1) // [1 2 3]
}
```

> 不推荐：
>
> - 当然也可以将声明和初始化一步完成

```go
package main

import "fmt"

func main() {
	// 不推荐：一行代码完成声明和初始化赋值
	var arr2 [3]int = [3]int{4, 5, 6}
	fmt.Println(arr2) // [4, 5, 6]
}
```

##### 1.2.2 短变量初始化赋值

> 推荐使用：
>
> - 短变量方式声明和初始化赋值一行代码完成，推荐使用`[...]`形式
>   - 可以在`[]`设置确认的长度值
>   - 可以在`[]`用三个`...`代替(`[...]`)，表示数组值的个数由`go`自动推导长度

```go
package main

import "fmt"

func main() {
	// ！！！推荐：一行代码完成，三个点表示数组值的个数由go自动推导长度
	arr2 := [...]int{4, 5, 6}
	fmt.Println(arr2) // [4, 5, 6]
	
    // 数组初始化赋值
    arr1 := [3]int{1, 2, 3}
	fmt.Println(arr1) // [1 2 3]
}
```

> 不推荐使用分步骤先声明、再赋值

##### 1.2.3 固定索引值初始化赋值

> 指定固定索引值进行声明初始化数组，其余元素有零值补全

```go
package main

import "fmt"

func main() {
	// 一行代码完成
	arr1 := [...]int{0:3, 4:3}
	fmt.Println(arr1) // [4, 5, 6]
}
```

#### 1.3 数组比较

> `数组长度和元素类型是数组整个类型的一部分`,所以长度不同，即使类型相同的数组也不能进行比较
>
> 这是和其他语言的不一样的地方

```go
package main

import "fmt"

func main() {
	var arr1 [3]int
	var arr2 [3]int
	var arr3 [4]int

	fmt.Println(arr1 == arr2) // true
	fmt.Println(arr1 == arr3)  // invalid operation: arr1 == arr3 (mismatched types [3]int and [4]int)
}

// arr1 == arr3 不能比较，会报错，因为长度也是数组的一部分,那么arr1和arr3不相等
// 会报错：invalid operation: arr1 == arr3 (mismatched types [3]int and [4]int)
// 翻译过来就是：无效操作：arr1 == arr3（类型[3]int和[4]int不匹配）
```

![image-20211206173943254](go%E7%AC%94%E8%AE%B0.assets/image-20211206173943254.png)

#### 1.4 数组的遍历

> 对数组进行变量，使用`for`循环

> c语言风格for循环

```go
package main

import "fmt"

func main() {
	var arr1 [3]string
	arr1 = [3]string{"sam", "bob", "lily"}

	// c语言风格for循环
	for i := 0; i < len(arr1); i++ {
		fmt.Printf("%v: %v\n",i, arr1[i])
	}
}

// 输出
/*
    0: sam
    1: bob
    2: lily
*/
```

> `for range`循环数组
>
> `for range`只有一个变量时，这个值为索引值

```go
package main

import "fmt"

func main() {
	// for range遍历
	arr2 := [...]string{"jix", "sem", "eop"}
	for i, v := range arr2 {
		fmt.Printf("%v:%v\n", i, v)
	}
}

// 输出
/*
    0:jix
    1:sem
    2:eop
*/
```

#### 1.5 多维数组

##### 1.5.1 定义多维数组

```go
package main

import "fmt"

func main() {
	// 多维数组
	// [[1 2] [3 4] [5 6]]
	var arr1 [3][2]int
	fmt.Println(arr1) // [[0 0] [0 0] [0 0]]

	// 初始化
	arr1 = [3][2]int{
		[2]int{1, 2},
		[2]int{3, 4},
		[2]int{5, 6},
	}
	fmt.Println(arr1) // [[1 2] [3 4] [5 6]]
}
```

##### 1.5.2 遍历多维数组

```go
package main

import "fmt"

func main() {
	// 多维数组
	// [[1 2] [3 4] [5 6]]
	var arr1 [3][2]int
	fmt.Println(arr1) // [[0 0] [0 0] [0 0]]

	// 初始化
	arr1 = [3][2]int{
		[2]int{1, 2},
		[2]int{3, 4},
		[2]int{5, 6},
	}
	fmt.Println(arr1) // [[1 2] [3 4] [5 6]]

	// C语言风格
	for i := 0; i < len(arr1); i++ {
		for j:= 0; j < len(arr1[i]); j++ {
			fmt.Printf("每个元素: %v\n", arr1[i][j])
		}
	}

	// for range风格
	for _, v1 := range arr1 {
		fmt.Printf("\n最外层的元素: %v\n", v1)
		for _, v2 := range v1 {
			fmt.Printf("最里面的元素: %v\n", v2)
		}
	}
}
```

![image-20211206181116451](go%E7%AC%94%E8%AE%B0.assets/image-20211206181116451.png)



#### 1.6 数组是值类型

> 将一个`A数组`赋值给另一个`B数组`，这样就相当于是将`A`数组完全复制了一份给`B数组`
>
> 修改`B数组`的元素，不会影响`A数组`，相当于`B数组`是`A数组`的副本，完全拷贝了`A数组`一份

```go
package main

import "fmt"

func main() {
	// 数组是值类型
	s1 := [...]int{1, 2, 3}
	s2 := s1
	s2[0] = 100

	fmt.Println(s1) // [1 2 3]
	fmt.Println(s2) // [100 2 3]
}
```

#### 1.7 数组例题

> 求数组元素的所有和

```go
func addArrSum() {
	s1 := [...]int{1, 2, 3, 4, 5}
	sum := 0
	for _, v := range s1 {
		sum = sum + v
	}
	fmt.Printf("sum = %v", sum)
}
```

> 求数组和为数组中指定的两个元素的下标
>
> 例如：[1,2,3,4,5]
>
> 求和为5的两个元素的下标

```go
package main

import "fmt"

func main() {
	s1 := [...]int{1, 2, 3, 4, 5}
	const sum = 5
	for i:= 0; i < len(s1); i++ {
		for j := i + 1; j < len(s1); j++ {
			if s1[i] + s1[j] == sum {
				fmt.Printf("(%v, %v)\n", i, j)
			} else {
				continue
			}
		}
 	}
}

/*		
输出
	(0, 3)
	(1, 2)
*/
```

### 2、切片

> `!!!比较重要`
>
> - 切片是一个用于相同类型元素的可变长的序列
> - 是数组类型的一层包装，更加灵活，支持自动增加数组长度
> - 切片属于`引用类型`
>   - 内部包含: `地址`、`长度`和`容量`
> - 切片可以快速操作数据集合

#### 2.1 声明切片

> 切片声明时只指定了类型，不需要指定切片长度，别的声明、初始化赋值切片格式都和数组一致，不做过多赘述
>
> - 不过切片底层还是数组
>
> - 切片声明以后
>   - 切片是没有零值(默认值)的，这个和数组是很大的区别
>   - 因为该切片长度为0，容量也为0
>   - 切片没有零值(默认值)，那这个切片的值是空，一个元素都没有，该切片的值就是`nil`，在其他编程语言里表示空，`redis`里表示空就是用`nil`表示
>   - 声明切片和nil相比较等于关系，一定是`true`

```go
// 声明切片格式
var 切片变量名 []T

// 切片名： 也叫变量名
// [] ：表示不需要设置切片长度
// T：表示切片中的元素类型
// 可以看到声明切片就不需要指定长度了
```

```go
package main

import "fmt"

func main() {
	// 切片
    
    // 定义整型类型的切片
	var s1 []int
    
    // 定义字符串类型的切片
	var s2 []string
    
    // 定义布尔类型的切片
	var s3 []bool

	fmt.Printf("%#v\n", s1) // []int(nil)
    fmt.Printf(s1 == nil) // true
	fmt.Printf("%T\n", s1) // []int

	fmt.Printf("%v\n", s2) // []
	fmt.Printf("%T\n", s2) // []string


	fmt.Printf("%v\n", s3) // []
	fmt.Printf("%T\n", s3) // []bool
}
```

#### 2.2 切片初始化

> 切片初始化和数组初始化是一样进行操作的，切片不需要在`[]`中写长度
>
> 支持三种方式
>
> - 第一种：先声明，再初始化
> - 第二种：短变量方式声明并且初始化，一步完成，一定要带花括号(`{}`)
>
> - 第三种：根据索引来初始化，其他元素用零值(默认值)补全

```go
package main

import "fmt"

func main() {
	// 定义整型类型的切片
	var s1 []int
	s1 = []int{1,2,3,4,5}
	fmt.Printf("%v\n", s1) // [1 2 3 4 5]
	fmt.Printf("%T\n", s1) // []int

	// 短变量声明切片
	s2 := []int{1,2,3,4,5}
	fmt.Printf("%v\n", s2) // [1 2 3 4 5]
	fmt.Printf("%T\n", s2) // []int

	// 指定固定索引值
	s3 := []int{0:4, 4:9}
	fmt.Printf("%v\n", s3) // [4 0 0 0 9]
	fmt.Printf("%T\n", s3) // []int
}
```

#### 2.3 由数组得到切片

> 可以由原始数组得到切片，和`python`的切片操作一致
>
> - 切片`s[x:y]`
>   - 表示`左包含右不包含`(左闭右开)，俗称"顾头不顾腚"
>   - 那么`切片s`就是从`原始数组`的`x索引开始`，到`原始数组`的`(y-1)索引结束`的这一段元素

```go
package main

import "fmt"

func main() {
	// 定义一个数组
	s1 := [...]int{1,2,3,4,5,6,7,8,9}

	// 切片1
	s2 := s1[0:4]
	fmt.Println(s2) // [1 2 3 4]

	// 切片2
	s3 := s1[:4] // 等价于 s1[0:4]
	fmt.Println(s3) // [1 2 3 4]

	// 切片3
	s4 := s1[:len(s1)] // 等价于 s1[:len(s1)],因为是左闭右开，所以右边的值会比索引小1
	fmt.Println(s4) // [1 2 3 4 5 6 7 8 9]

	// 切片3
	s5 := s1[:] // 表示切片了整个数组，相当于是复制了整个数组，但是注意切片是引用类型
	fmt.Println(s5) // [1 2 3 4 5 6 7 8 9]
}
```

#### 2.4 切片长度和容量

> - 切片长度：`len(切片变量名)`，求出切片的元素个数
>
> - 切片容量：`cap(切片变量名)`, 是指将从原始数组被切片的第一个元素开始，到切片原始数组的的最后一个元素的全部元素个数
>   - 切片容量表示了可以往右边切元素，直到切到原始数组最后一个元素，也就是说可以切片的总体容量

```go
package main

import "fmt"

func main() {
	// 切片
	// 由数组得到切片
	s1 := [...]int{1,2,3,4,5,6,7,8,9}

	// 表示切片了整个数组，相当于是复制了整个数组，但是注意切片是引用类型
	s2 := s1[:4]
	fmt.Printf("%v\n", s2) // [1 2 3 4]
	fmt.Printf("%v\n", len(s2)) // 4
	fmt.Printf("%v\n", cap(s2)) // 9

	s3 := s1[4:7]
	fmt.Printf("%v\n", s3) // [5 6 7]
	fmt.Printf("%v\n", len(s3)) // 3
	fmt.Printf("%v\n", cap(s3)) // 5
}
```

![image-20211206194456407](go%E7%AC%94%E8%AE%B0.assets/image-20211206194456407.png)

![image-20211206194604406](go%E7%AC%94%E8%AE%B0.assets/image-20211206194604406.png)



#### 2.5 切片再切片

> 可以对切片再进行切片，但是索引长度不能超过原数组长度，否则会出现数组索引越界情况 
>
> - `切片是引用类型，指向了底层数组`:
>   - 引用类型：表示切片和原始数组都指向了同一个数组
>   - 修改了底层数组的元素值，那么切片对应位置元素的值也会被修改

```go
package main

import "fmt"

func main() {
	var s1 []int
	s1 = []int{1,2,3,4,5,6}

	// 先对定义的切片s1进行切片s2
	s2 := s1[2:]
	fmt.Printf("%v\n", s2)
	fmt.Printf("len(s2)=%v cap(s2)=%v\n", len(s2), cap(s2))

	// 再对切片s2再进行切片出来s3
	s3 := s2[1:2]
	fmt.Printf("%v\n", s3)
	fmt.Printf("len(s3)=%v cap(s3)=%v\n", len(s3), cap(s3))

	// 切片是引用类型，指向了底层数组
	// 可以看到修改了原始切片s1，对应的s2切片的值也会修改成和s1一样
	s1[4] = 400
	fmt.Printf("%v\n", s2)
}
```

#### 2.6 `make`函数定义切片

> 上面的`切片声明`、`由数组获得切片`都是基于数组而产生切片，这两种方式创建的切片，长度和容量是由原始数组限制了，不能超过原始数组的长度和容量，没法在指定切片的时候就指定切片的长度和容量，那有没有直接定义切片的方式，那就是`make`函数
>
> - `make`函数是内置函数，可以动态创建切片
>   - 为什么说动态呢？
>     - 因为`make`提供了两个参数：`size`和`cap`，可以自由指定切片长度和容量
>     - 定义以后的切片根据`size`值通过零值(默认值)填充切片
>     - 定义后初始化切片，切片的容量可以不受`cap`值的限制，可以在初始化时定义大于`cap`值数量的元素，那么这个初始化以后的切片的长度和容量会根据初始化时填写的元素数量动态变化
>     - 那为什么`make`函数定义切片时还需要指定`size`和`cap`，个人理解是定义切片时只是作为一个初始值，但是初始化切片(往切片里塞元素值)时可以无限增大，这就是动态创建切片
>     - 但是`make`函数定义切片时可以省略`cap`参数值(不传`cap`值表示和`size`值一样)，不能不传`len`参数，会报错提示缺少`len`参数
>       - `./main.go:6:12: missing len argument to make([]int)`
> - `make`函数定义后，需要进行初始化，初始化和声明切片的方式一样，但是不能超过容量长度，否则会爆错
> - 注意
>   - make函数定义切片是，size参数值不能大于cap参数值，否则会报错
>     - ```./main.go:6:12: len larger than cap in make([]int)```

```go
// make函数创建切片
make([]T, size, cap)

// []T: 表示切片的类型
// size: 表示切片的长度，也就是len()切片元素个数返回的值
// cap: 表示切片的容量，也就是cap()切片容量返回的值
// 当size、cap参数只写一个数字时，表示size和cap都是同一个值
```

```go	
package main

import "fmt"

func main() {
    // 只写size的值，表示size和cap参数值都是同一个
	s1 := make([]int, 5)
	fmt.Printf("%v\n",s1) // [0 0 0 0 0]
	fmt.Printf("len(s1)=%v cap(s1)=%v\n",len(s1), cap(s1)) // len(s1)=5 cap(s1)=5
	
    // 下面表示切片长度为0，容量为10
    // s2=[]，表示底层数组就是空的,但是这个切片的容量长度是10
	s2 := make([]int, 0, 10)
	fmt.Printf("%v\n",s2) // 
	fmt.Printf("len(s2)=%v cap(s2)=%v\n",len(s2), cap(s2))  // len(s1)=0 cap(s1)=10
}
```

```go
package main

import "fmt"

func main() {
	s1 := make([]int, 5, 10)
	s2 := make([]string, 5, 10)
	s3 := make([]bool, 5, 10)
	fmt.Printf("%v\n", s1)
	fmt.Printf("%v\n", s2)
	fmt.Printf("%v\n", s3)

	// 通过make函数初始化的切片，对切片进行初始化
	s1 = []int{1,2,3}
	fmt.Printf("%v\n", s1)
}
```

#### 2.7 切片比较运算

> 因为切片是`引用类型`，不能使用`==`来进行两个切片的全部元素是否相等比较
>
> 切片只能和`nil`进行比较

```go
package main

import "fmt"

func main() {
	s1 := make([]int, 5)

	s2 := make([]int, 5)
	fmt.Println(s1 == s2)
}

// 下图的报错提示了slice只能用nil来比较
```

![image-20211207130223515](go%E7%AC%94%E8%AE%B0.assets/image-20211207130223515.png)



#### 2.8 切片`nil`值

> - 只有声明切片方式得到的切片的值是`nil`
>
> - 切片值是`nil`
>   - 这个切片的长度和容量都是0
>   - 表示这个切片是没有底层数组的
> - 不能说`长度为0`、`容量为0`的切片一定是`nil`

```go
package main

import "fmt"

func main() {
	// 声明一个切片，它的值才是nil
	var s1 []int
	fmt.Println(s1 == nil) // true
	fmt.Printf("s1=%#v len(s1)=%v cap(s1)=%v\n", s1, len(s1), cap(s1)) // s1=[]int(nil) len(s1)=0 cap(s1)=0

	// 短变量声明并初始化一个切片，可以看到s2的长度和容量都是0，但是s2不等于nil
	s2 := []int{}
	fmt.Printf("s2=%#v len(s2)=%v cap(s2)=%v\n", s2, len(s2), cap(s2)) // s2=[]int{} len(s2)=0 cap(s2)=0
	fmt.Println(s2 == nil) // false

	// make函数构造一个切片
	s3 := make([]int, 0)
	fmt.Println(s3 == nil) // false
	fmt.Printf("s3=%#v len(s3)=%v cap(s3)=%v\n", s3, len(s3), cap(s3)) // s3=[]int{} len(s3)=0 cap(s3)=0
}
```

#### 2.9 判断切片是否为空

> 判断切片是否为空，不能用`nil`判断，而是要用`len() == 0`

```go
package main

import "fmt"

func main() {
	// 声明一个切片，它的值才是nil
    // s1长度是0
	var s1 []int
	fmt.Printf("s1=%#v len(s1)=%v cap(s1)=%v\n", s1, len(s1), cap(s1)) // s1=[]int(nil) len(s1)=0 cap(s1)=0
	fmt.Println(len(s1) == 0) // true

	// 短变量声明并初始化一个切片，可以看到s2的长度和容量都是0，s2的长度是0
	s2 := []int{}
	fmt.Printf("s2=%#v len(s2)=%v cap(s2)=%v\n", s2, len(s2), cap(s2)) // s2=[]int{} len(s2)=0 cap(s2)=0
	fmt.Println(len(s2) == 0) // true

}
```

![image-20211207132221179](go%E7%AC%94%E8%AE%B0.assets/image-20211207132221179.png)



#### 2.10 切片赋值

> 可以将切片作为另一个变量的值
>
> 可以看出来`s2`引用了`s1`切片，`s1`的第三个元素值变化了，那么`s2`的第三值也会变化
>
> 切片不保存值，切片只是一个框，切片的值指向底层的数组

```go
package main

import "fmt"

func main() {
	s1 := []int{1,2,3,4}
	s2 := s1

	fmt.Println("修改切片s1之前")
	fmt.Println(s1) // [1 2 3 4]
	fmt.Println(s2) // [1 2 3 4]


	s1[2] = 1000
	fmt.Println("\n修改切片s1以后")
	fmt.Println(s1) // [1 2 1000 4]
	fmt.Println(s2) // [1 2 1000 4]
}
```

#### 2.11 切片遍历

> 可以使用`for`循环对切片进行遍历,和遍历数组一样

```go
package main

import "fmt"

func main() {
	s1 := make([]int, 5, 10)

	// 通过make函数初始化的切片，对切片进行初始化
	s1 = []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
	fmt.Printf("%v\n", s1)
	fmt.Printf("len(s1)=%v cap(s1)=%v\n", len(s1), cap(s1))

	// c语言风格
	fmt.Println("\nc语言风格")
	for i := 0; i < len(s1); i++ {
		fmt.Printf("%v:%v\n", i, s1[i])
	}

	// for range形式
	fmt.Println("\nfor range形式")
	for i, v := range s1 {
		fmt.Printf("%v:%v\n", i, v)
	}
}
```

#### 2.12 切片`append`添加元素

> - 调用`append`函数必须要用原数组变量名接收返回值
>- 追加元素时，原来的底层数组放不下时，`go`会将底层数组更换一个新的数组内存地址，并且新的数组内存地址进行了自动扩容，那么更换了个那就必须接收，所以要用原来的切片变量名来进行接收
> - 自动扩容有时候是原来数组长度的2倍
>- `append`函数可以追加一个元素，追加多个元素，追加切片
>   - 相当于是两个切片相加

```go
// 格式
切片 = append(切片变量名，需要追加的元素)
```

```go
package main

import "fmt"

func main() {
	// 定义切片
	s1 := []string{"sam", "bob", "lily"}
	fmt.Printf("%v\n", s1)
	fmt.Printf("len(s1)=%v  cap(s1)=%v\n", len(s1), cap(s1)) // len(s1)=3  cap(s1)=3

	// 调用append函数必须要用原数组变量名接收返回值
	// 追加一个元素
	s1 = append(s1, "six_people")
	fmt.Printf("%v\n", s1) // [sam bob lily six_people]
	fmt.Printf("len(s1)=%v  cap(s1)=%v\n", len(s1), cap(s1)) // len(s1)=4  cap(s1)=6

	// 追加多个元素
	s1 = append(s1, "aliy", "wide")
	fmt.Printf("%v\n", s1) // [sam bob lily six_people wide wide]
	fmt.Printf("len(s1)=%v  cap(s1)=%v\n", len(s1), cap(s1)) // len(s1)=4  cap(s1)=6
}
```

> 将一个切片追加到另一个切片
>
> `append`函数里追加另一个切片
>
> - `s1 = append(s1, s2...)`
> - `s2...`表示将s2切片拆开，不是省略号

```go
package main

import "fmt"

func main() {
	// 定义切片
	s1 := []string{"sam", "bob", "lily"}
	fmt.Printf("%v\n", s1)
	fmt.Printf("len(s1)=%v  cap(s1)=%v\n", len(s1), cap(s1)) // len(s1)=3  cap(s1)=3

	// 追加一个切片
	s2 := []string{"lining", "xiaohong"}
    
    // s2... 表示将s2拆开，不是省略号，将s2切片整个都追加到s1切片
	s1 = append(s1, s2...)
	fmt.Printf("%v\n", s1) // [sam bob lily lining xiaohong]
	fmt.Printf("len(s1)=%v  cap(s1)=%v\n", len(s1), cap(s1)) // len(s1)=7  cap(s1)=12

}
```

#### 2.13 切片`copy`

> 由于切片是引用类型，当把一个切片指向另一个切片时，修改一个切片的值，另一个切片也会跟着修改
>
> 为了解决这种问题，引入了`copy`函数
>
> - `copy`函数可以快速的将一个切片完整复制到另一个切片空间中
> - 即使修改了原始的切片元素值，`copy`过去的切片对应位置的元素值也不会修改

```go
// 格式
copy(目标切片， 源切片 []T)
```

```go
package main

import "fmt"

func main() {
	// 定义切片
	s1 := []int{1, 2, 3}
	s2 := s1
	s3 := make([]int, 3)
    // copy切片，s3是目标切片，s1是源切片
	copy(s3, s1)
    
    // 修改源切片s1的第一个元素值为100
	s1[0] = 100
	fmt.Printf("s1 = %v\n", s1) //  [100 2 3]
	fmt.Printf("s2 = %v\n", s2) //  [100 2 3]
	fmt.Printf("s3 = %v\n", s3) //  [1 2 3]
}

// 可以看到s3 copy了s1切片后，即使s1的元素值修改了，s3的也不会变
```

#### 2.14 切片删除元素

> `go`语言中没有特定删除切片指定元素的方法，需要自己写
>
> `切片`修改的是底层数组
>
> 切片在这里修改了某个值，底层数组的值也会进行修改

```go
// 格式
a := []int{1,2,3,4,5,6}
a = append(a[:index], a[index+1:]...)

// 这三个点(...)是表示把切片元素拆开追加到另一个数组里，不是省略号的意思
```

```go
package main

import "fmt"

func main() {
	// 删除切片指定索引位置元素
	s1 := []int{1, 2, 3, 4, 5}

	// 比如删除索引位置为2，值为3的元素
	s1 = append(s1[:2], s1[3:]...)
	fmt.Printf("%v\n", s1)
}
```

```go
package main

import "fmt"

func main() {
	// 定义数组
	s1 := [...]int{1,2,3,4,5,6}
	// 拿到切片
	s2 := s1[:]
	// 删除元素3前:
	// 切片s2是 [1 2 3 4 5 6]
	// len(s2) = 6, cap(s2)=6
	fmt.Println(s2, len(s2), cap(s2))

	// 切片是引用类型，如果对切片进行了删除值的操作
	// 那么底层数组的值也会被修改，但是切片不保存值
	// 切片操作的是底层数组

	// 删除元素3前，s2[0]的内存地址：0xc00000c450
	fmt.Printf("%p\n", &s2[0])
	s2 = append(s2[:2], s2[3:]...)  // 操作的是底层数组

	// 删除元素3后，s2[0]的内存地址：0xc00000c450
	fmt.Printf("%p\n", &s2[0])

	// 可以看出来，删除元素前后，切片的内存地址没有变
	// 那么也说明了切片不存值，对应操作的也是底层数组

	// 删除元素3后:
	// 切片s2变成了 [1 2 4 5 6]
	// len(s2) = 5, cap(s2)=6
	fmt.Println("s1:", s1, len(s1), cap(s1))
	fmt.Println("s2:", s2, len(s2), cap(s2))

	// 比如修改切片s2的第一个元素值
	//s2[0] = 100
	fmt.Printf("s2[0]的内存地址: %p\n", &s2[0])
	fmt.Printf("底层数组s1: %v\n", s1)
	fmt.Printf("切片s2: %v\n", s2)
}
```

![image-20211208141932267](go%E7%AC%94%E8%AE%B0.assets/image-20211208141932267.png)

#### 2.15 切片是引用类型验证

> `切片是引用类型，指向了底层数组`
>
> 下面是切片属于引用类型的验证
>
> - 可以看到从`数组s1`进行了切片得到了`切片s2`
> - 然后对切片后得到的`切片s2`进行了第一个元素重新赋值
> - 以及对`原始数组s1`的第三个元素重新赋值
> - 最后输出`数组s1`和`数组s2`的元素都为一致
>
> 由此可以看出切片是引用类型，不管是修改了切片的某个元素值，还是修改了原始数组的某个元素值，原始数组或切片共同位置的元素也会进行同步修改

```go
package main

import "fmt"

func main() {
	// 切片
	// 由数组得到切片
	s1 := [...]int{1,2,3,4,5,6,7,8,9}

	// 表示切片了整个数组，相当于是复制了整个数组，但是注意切片是引用类型
	s2 := s1[:]

	// 修改s2的第一元素的值
	s2[0] = 100
    
    // 修改s1的第三元素的值
	s1[2] = 399
	// 可以看到s1和s2的第一个元素的值都被修改了
	fmt.Println(s2) // [100 2 399 4 5 6 7 8 9]
	fmt.Println(s1) // [100 2 399 4 5 6 7 8 9]
}
```

#### 2.16 切片本质

> 切片本质就是一个框，框住了一段连续的内存区域，真正的数据是保存在底层数组中
>
> 切片是引用类型
>
> 切片不保存具体的值
>
> 切片对应一个底层数组
>
> 底层数组是一段连续的内存区域

#### 2.17 切片练习题

> `for`循环生成切片

```go
package main

import "fmt"

func main() {
	// 创建切片,下面是长度为5，有5个0的切片
	s1 := make([]int, 5, 10)
	for i := 0; i < 10; i++{
		s1 = append(s1, i)
	}
	fmt.Printf("%v", s1) // 追加到5个0后面，所以结果是: [0 0 0 0 0 0 1 2 3 4 5 6 7 8 9]
}
```

### 3、指针

> `go`语言中不存在指针运算，仅可以操作指针
>
> go中操作指针
> `&` : 取变量的内存地址，内存地址是一个16进制数
>
> `*` : 根据内存地址取值，获取到的是这个内存地址指向的原始值

> - 从下图和代码可以看出来
>   - 变量`a`定义以后会申请一块内存空间，用来存变量`a`的值
>   - 那么申请的内存空间的地址永远不会变，但是变量`a`的值可以变，也就是说变量`a`可以进行重复赋值，但是变量`a`的内存地址永不会变
>
> - 就是说申请好内存地址以后，可以放任意值进去，但是内存地址申请好以后是不会变得

![image-20211221174834896](go%E7%AC%94%E8%AE%B0.assets/image-20211221174834896.png)

```go
package main

import "fmt"

func main() {
	// 查看内存地址：&
	age := 18
	ageMemAddr1 := &age
	fmt.Printf("age的值:%v\n", age) // 18
	fmt.Printf("age的内存地址: %p\n", ageMemAddr1) // 0xc000128008
	
	// 根据内存地址取变量指向的具体值
	ageVal1 := *ageMemAddr1
	fmt.Printf("根据age的内存地址取对应值:%v\n", ageVal1)
	
	
	fmt.Printf("\n对age重新赋值\n")
	
	// 对age重新赋值，但是age的内存地址不变，但是age指向的值会变
	age = 28
	ageMemAddr2 := &age
	fmt.Printf("age的值:%v\n", age) // 18
	fmt.Printf("age的内存地址: %v\n", ageMemAddr2) // 0xc000128008
	
	ageVal2 := *ageMemAddr2
	fmt.Printf("根据age的内存地址取对应值:%v\n", ageVal2)
	
	fmt.Printf("\nage重新赋值后的内存地址没有变:%v\n", ageMemAddr1 == ageMemAddr2)
}

/*
	执行结果:
        age的值:18
        age的内存地址: 0xc00001e098
        根据age的内存地址取对应值:18

        对age重新赋值
        age的值:28
        age的内存地址: 0xc00001e098
        根据age的内存地址取对应值:28

        age重新赋值后的内存地址没有变:true
*/
```





### 4、`new`(很少用)

> `new`函数用来申请内存地址
>
> `new`很少用，一般用来给基础数据类型申请内存，string\int, 返回的是对应类型指针 

```go
package main

import "fmt"

func main() {
	// var 声明变量时需要指定类型，下面是给a1指定的类型是 指针类型，表示我想定义一个空指针变量, 然后对这个空指针经过*号获取原来的值进行重新赋值
	// 但是指针类型的零值是nil，
	// 所以会报错：panic: runtime error: invalid memory address or nil pointer dereference，翻译过来: 解除对空指针的引用
	//var a1 *int
	//fmt.Printf("%v\n", a1)
	//*a = 100

	// new函数申请内存地址
	var a2 = new(int)
	// 申请了一个内存地址
	fmt.Printf("%v\n", a2)  // 0xc00001e098
	// *a2表示根据内存地址找到对应的值
	fmt.Printf("%v\n", *a2) // 0
	// 重新对这个内存地址对应的值进行赋值,因为它是一个int类型的内存地址,所以int类型的零值是0，所以输出为0
	// 再对这个内存地址对应的值重新赋值为100，其实可以把(*a2)理解为一个变量名，一开始它的值是0，下面重新又赋一个值100
	*a2 = 100
	// 再次打印出该内存地址对应的值
	fmt.Printf("%v\n", *a2) // 100
}
```

### 5、`make`和`new`的区别

> `make`也是用于内存分配，区别于`new`
>
> `make`区别点:
>
> - 只用于切片`slice`、`map`、`chanl`的内存创建
> - 并且返回的是上面这三种类型本身，不是他们的指针类型, 因为这三种属于引用类型

### 6、`map`

> `map`是一种无序的基于`key-value`的数据结构
>
> `map`属于引用类型
>
> 必须初始化才可以用
>
> `map`和`python`里的`dict`很类似

#### 6.1 `var`关键字声明`map`

```go
// 格式
map[KeyType]ValueType

// KeyType:表示键类型
// ValueType:表示值类型
```

> 从下面代码可以看到
>
> - `var`关键字声明的`map`本来就是`map[]`，本质的值是`nil`,所以和`nil`比较是`true`
> - `map`的类型是包含了`KeyType`和`ValueType`，`key-value`的`type`也是`map`整个类型的一部分

```go
package main

import "fmt"

func main() {
	// 声明map
	var m1 map[string]int
	fmt.Printf("%v\n", m1) // map[]
	fmt.Printf("%#v\n", m1) // map[string]int(nil)
    fmt.Printf("m1==nil:%v\n", m1==nil) // m1==nil:true
	fmt.Printf("%T\n", m1) // map[string]int
}
```

> `map`类型初始值是`nil`，不能直接给`map`来赋值，会报错的

```go
package main

import "fmt"

func main() {
	// 定义map
	var m1 map[string]int
	m1["age"] = 18
	fmt.Printf("%v\n", m1["age"])

}
// 会看到有一个panic错误
```

![image-20211208233358205](go%E7%AC%94%E8%AE%B0.assets/image-20211208233358205.png)



#### 6.2 `map`初始化

##### 6.2.1 `var`关键字初始化

> 如果只是用var声明了一个`map`,并没有初始化，那这个`map`的值是`nil`，表示还没有初始化（也就是没有在内存里开辟空间）
>
> 需要使用`make()`函数来分配内存，也就是初始化`map`

> 先来看看`make()`函数初始化格式

```go
make(map[KeyType]ValueType, [cap])
// make的第一个参数：map[KeyType]ValueType 表示是一个map类型
// make的第二个参数： [cap]表示map的容量，非必填参数，但还需要给指定一个容量
```

```go
package main

import "fmt"

func main() {
	// 定义map
	var m1 map[string]int
	m1 = make(map[string]int, 10) // 
	m1["age1"] = 18
	m1["age2"] = 28
	m1["age2"] = 900
	fmt.Printf("%v\n", m1) // map[age1:18 age2:900]
	fmt.Printf("%v\n", m1["age1"]) // 18
	fmt.Printf("%v\n", m1["age2"]) // 900
}
```

> 从上面代码可以看出，在初始化好`map`以后：
>
> - 可以正常填充键值对
> - 当键有多个一样时，最终在`map`里只会留下最后一个相同的`key-value`
> - 因为容量是可以自动扩容的，所以建议在使用`make`函数定义容量时，估算好容量，避免自动扩容，因为自动扩容会增大运行速度

##### 6.2.2 短变量初始化

> `map`也可以使用短变量进行初始化，省去了声明的步骤，一步做到声明+初始化

```go
package main

import (
	"fmt"
)

func main() {
	// map
	m1 := make(map[int]string, 5)
	m1[0] = "bob"
	m1[1] = "sam"
	m1[2] = "alop"
	
	fmt.Printf("%v\n", m1) // map[0:bob 1:sam 2:alop]
}

```

#### 6.3 `map`获取`key-value`

> `map`取值也是用中括号里面放`key`来取值，和`python`一样
>
> 注意：
>
> - 取值时是可以接收两个值，第一个是值本身，第二个是这个值是否存在的布尔说明，如果存在则返回`true`，不存在则返回`false`
>   - `v1, ok := m1["age1"]` 这个ok是约定成俗的一个接收`key`是否存在的变量，就和`python`面向对象里的`self`一样,换成别的也可以
>     - 所以就可以用`ok`这个值来判断`key`是否存在
>   - 当获取的`key`不存在时，`ok`是`false`,并且查找的值是值类型的零值(默认值)

```go
package main

import "fmt"

func main() {
	// 定义map
	var m1 map[string]int
	m1 = make(map[string]int, 10)
	m1["age1"] = 18
	m1["age2"] = 28
	m1["age3"] = 900
	fmt.Printf("%v\n", m1)
	fmt.Printf("%v\n", m1["age1"])
	fmt.Printf("%v\n", m1["age2"])

	v1, ok := m1["age1"]
	fmt.Printf("v1=%v ok=%v\n", v1, ok) // v1=18 ok=true
	fmt.Printf("v1=%T ok=%T\n", v1, ok) // v1=int ok=bool
	if ok {
		fmt.Printf("age1的val:%v\n", v1)
	} else {
		fmt.Printf("age1这个key不存在\n")
	}

	// 如果key不存在直接去获取，那么拿到的是对应值类型的零值(默认值)
	v2， ok := m1["age"]
	fmt.Printf("v2=%v\n", v2) // v2=0 ok=false
}
```

#### 6.3 `map`遍历

> 使用`for range`来遍历`map`

```go
package main

import "fmt"

func main() {
	// 定义map
	var m1 map[string]int
	m1 = make(map[string]int, 10)
	m1["age1"] = 18
	m1["age2"] = 28
	m1["age3"] = 900

	// 遍历map的key-value
	fmt.Printf("遍历map的key-value\n")
	for k,v := range m1 {
		fmt.Printf("%v:%v\n",k,v)
	}

	// 只遍历map的key
	fmt.Printf("\n只遍历map的key\n")
	for k := range m1 {
		fmt.Printf("%v\n",k)
	}

	// 只遍历map的value
	fmt.Printf("\n只遍历map的value\n")
	for _, v := range m1 {
		fmt.Printf("%v\n",v)
	}
}
```

#### 6.5 删除键值对

> 使用`delete函数`删除`map`的键值对
>
> 当删除的`key`不存在时，不做任何处理

```go
// 格式
delete(map, key)

// map: 表示要删除的map
// key: 表示要删除的键值对的键
```

```go
package main

import "fmt"

func main() {
	// 定义map
	var m1 map[string]int
	m1 = make(map[string]int, 10)
	m1["age1"] = 18
	m1["age2"] = 28
	m1["age3"] = 900

	// 删除键值对
	delete(m1, "age1")
	fmt.Printf("%v\n", m1) // map[age2:28 age3:900]

	// 删除不存在的键
	delete(m1, "age")
	fmt.Printf("%v\n", m1) // map[age2:28 age3:900]
}
```

#### 6.6 `map`和切片互相转换

> `map`里可以放切片，同时切片里可以放`map`

##### 6.6.1 切片的元素值是`map`

> 切片的每个元素的值都是`map`类型
>
> 注意：
>
> - 因为定义的切片的元素是`map`，所以要对每个元素还要进行分配内存初始化(`make`函数分配内存)

```go
package main

import (
	"fmt"
)

func main() {
	// 元素类型为map的切片
	
	// 先对切片初始化，分配内存空间
	var s1  = make([]map[string]int, 5, 5)
	
	// 需要先对切片里，内部的map进行初始化
	s1[0] = make(map[string]int, 1)
	s1[1] = make(map[string]int, 1)
	s1[2] = make(map[string]int, 1)
	
	// 重新赋值
	s1[0]["name1"] = 13
	s1[1]["name2"] = 23
	s1[2]["name3"] = 33
	
	fmt.Printf("%v\n", s1)
	fmt.Printf("%v\n", s1[2]["name3"])
}

```

##### 6.6.2 `map`的元素值是切片

> `map`的每个元素的值都是切片

```go
package main

import (
	"fmt"
)

func main() {
	// map的键值对的值是切片类型
	
	// 定义并初始化map,并且ValueType是一个切片类型: []int
	var m1  = make(map[string][]int, 5)
	
	fmt.Printf("%v\n", m1) // map[]
	
	// 对切片类型进行初始化
	m1["name1"] = make([]int, 5, 5)
	m1["name2"] = make([]int, 5, 5)
	
	// 对切片进行重新赋值
	m1["name1"] = []int{1,2,3}
	m1["name2"] = []int{4,5,6}
	
	fmt.Printf("%v\n", m1) // map[name1:[1 2 3] name2:[4 5 6]]
}

```

#### 6.7 `map`练习题

>  `map`可以用来统计长段字符串里每个单词出现的次数，下面是`go`/`python`版本

```go
// go版本
package main

import (
	"fmt"
	"strings"
)

func main() {
	// how do you do每个单词出现的次数
	longStr := "how do you do"
	
	// 将字符串转换成切片
	longStrToList := strings.Split(longStr, " ")
	
	// 声明一个空map
	longStrToMap := make(map[string]int, 6)
	for _, v := range longStrToList {
		_, ok := longStrToMap[v]
		if !ok {
			longStrToMap[v] = 1
		} else {
			longStrToMap[v]++
		}
	}
	fmt.Printf("\n%v\n", longStrToMap)
}
```

![image-20211209122734426](go%E7%AC%94%E8%AE%B0.assets/image-20211209122734426.png)

```python
# python版本
def cal_words_times():
    # 统计"how do you do"每个单词出现的次数
    say_hi = "how do you do"
    say_hi_list = say_hi.split(" ")

    say_hi_dict = {}
    for i in say_hi_list:
        if not i in say_hi_dict:
            say_hi_dict[i] = 1
        else:
            say_hi_dict[i] += 1
    return say_hi_dict
```

![image-20211209122721022](go%E7%AC%94%E8%AE%B0.assets/image-20211209122721022.png)

> 其实能够看出来，`go`和`python`语法有较多类似的地方，核心编程思想都是一样的，就是看如何用不同语言去实现

## 八、函数

> 比较重要的语法: `函数`
>
> 支持匿名函数、闭包

### 1、函数定义

```go
// 函数格式
func 函数名(参数) (返回值) {
    函数体
}
// 函数名：见名知意的函数名
// 参数： 参数由参数名和参数变量组成，多个以逗号隔开
// 返回值：由返回值变量和其类型组成，也可以只写返回类型，多个返回值用()包裹，用逗号(,)隔开
// 函数体：具体函数代码实现
```

#### 1.1 有参数和返回值变量

> 参数可以命名也可以不命名，
> 命名的返回值：
>
> - 相当于是在函数中提前声明一遍变量，比如下面的`ret`
>   - 可以在函数中直接使用,因为在函数定义时已经声明了`ret`这个变量
>   - 并且return时不需要显式指出`ret`这个变量名，因为都在函数定义时已经指明了返回值名字叫`ret`
> - 并且需要用`括号`将命名的返回值包裹起来`(ret int)`
>   - 表示返回值的变量名是`ret`，并且是一个`int`类型
> - 当然不管是形参、还是返回值变量名可以定义，也可不定义，不定义就只写返回类型，但是需要在函数`return`时显式的指定返回值

```go
// 有参数有返回值
func f1(a int, b int) (ret int) {
	ret = a + b
	return ret
}
```

#### 1.2 函数定义变种

> 下面的几种变种都是围绕`1.1`来扩展的

##### 1.2.1 有形参但没有返回值

> 只有`形参`，没有返回值
>
> 没有返回值的函数，不能用变量接收函数，直接`函数名+()`执行就可以

```go
package main

import (
	"fmt"
)

func main() {
	add(1,2)
	add(10,20)
}

func add(a int, b int){
	c := a + b
	fmt.Printf("%v + %v = %v\n",a,b,c)
}
```

##### 1.2.2 没有形参但有返回值

> 只有返回值，没有形参

```go
package main

import (
	"fmt"
)

func main() {
	ret := add()
	fmt.Printf("ret = %v\n", ret)
}

func add() int{
	c := 1 + 3
	return c
}

```

##### 1.2.3 没有形参和返回值

```go
package main

import (
	"fmt"
)

func main() {
	add()
	// fmt.Printf("ret = %v\n", ret)
}

func add(){
	s := 45
	fmt.Printf("%v\n", s)
}
```

##### 1.2.4 返回值没有指定变量名

```go
package main

import (
	"fmt"
)

func main() {
	ret := add()
	fmt.Printf("ret = %v\n", ret)
}

func add() int{
	s := 45
	return s
}
```

##### 1.2.5 返回值有多个

> - 返回值有多个，用括号包裹，然后逗号隔开
> - 在执行函数时，返回多少个值，必须用多少个值来接收
>   - 或者考虑将多个返回值组装成`切片`或者`map`返回

```go
package main

import "fmt"

func main() {
	x,y,z := add(1,2)
	fmt.Printf("%v\n", x) // 1
	fmt.Printf("%v\n", y) // 2
	fmt.Printf("%v\n", z) // 3
}

func add(x,y int) (int,int,int) {
	z := x + y
	return x, y, z
}
```

##### 1.2.6 形参类型省略

> 当传入多个形参的类型都一样时，可以值留最后一个形参的类型，前面的都可以省略，这个只适用于同种类型

```go
package main

import "fmt"

func main() {
	ret := add(1,2)
	fmt.Printf("%v\n", ret) // 3
}

func add(x, y int) (ret int) {
	ret = x + y
	return ret
}
```

#### 1.3 可变长参数

> 很像`python`里的可变长参数`args`和`kwargs`,可以接收`n`个参数进来，接收进来是一个`切片类型`
>
> 可变长参数使用三个点(`...`)表示,如下面的形参的`y`
>
> 可变长参数必须放在形参后面

```go
// 格式
func 函数名(形参 ...T)

// 形参: 形参名
// ...T: 可变长参数的类型
```

```go
package main

import (
	"fmt"
)

func main() {
	x, y := add(1,2,3)
	fmt.Printf("x = %v\n", x)
	fmt.Printf("y = %v\n", y)
}

func add(x int, y ...int) (int, []int){
	fmt.Printf("x: %v\n", x) 
	fmt.Printf("y: %v\n", y) //[2, 3]
	fmt.Printf("y type: %T\n", y) // []int
	return x,y
}
```

#### 1.4 形参没有默认值

> `go`语言中形参是没有默认值，不像`python`的函数，可以在形参指定一个默认值

#### 1.5 变量作用域

##### 1.5.1 全局作用域

> 全局作用域是指定义在函数外部区域，这里的变量可以在全局的任意位置访问到
>
> - 函数中查找变量的规则顺序：
>   1. 先在函数内部查找
>   2. 如果可以找到，就是用函数内部定义的变量
>   3. 如果找不到，那就在函数外部的全局变量查找，找到则是用
>   4. 在函数内部、函数外部都找不到，会报`undefined`的错误

```go
package main

import (
	"fmt"
)

var x int = 10  // 定义的是全局变量

func main() {
	/*
	函数中查找变量的规则顺序
	1、先在函数内部查找
	2、如果可以找到，就是用函数内部定义的变量
	3、如果找不到，那就在函数外部的全局变量查找，找到则是用
	4、在函数内部、函数外部都找不到，会报undefined的错误
	*/
	x = 123
	fmt.Printf("x=%v\n", x) // 123
}
```

> 如果变量在函数内外都没有定义，因为找不到该变量，会报`undefined`错误

```go
package main

import (
	"fmt"
)

var x int = 10  // 定义的是全局变量

func main() {
	x = 123
	fmt.Printf("x=%v\n", x) // 123
	
	// 输出变量y
	fmt.Printf("y=%v\n", y) // undefined
}
```

![image-20211213144417133](go%E7%AC%94%E8%AE%B0.assets/image-20211213144417133.png)

##### 1.5.2 局部作用域

> 局部作用域就是在函数内部区域的
>
> 局部作用域和全局作用域变量重名，优先使用局部作用域，表示是`就近原则`

##### 1.5.3 语法块作用域

> `go`语言中一些语法块也有自己的作用域，比如:`if循环`、`for循环`、`switch语句`常见的这三种
>
> 如果在语法块外部访问语法块内部的变量，都会报`undefined`错误

```go
package main

import (
	"fmt"
)

func main() {
	x := 13
	if x > 13 {
		y := 23
		fmt.Printf("y=%v\n", y) // if语句内的变量只能if语句内访问到，if外面访问不到
	}
	
	fmt.Printf("y=%v\n", y) // undefined: y

	s1 := []int{1,2,3,4,5}
	for _, v := range s1 {
		d := 99
		fmt.Printf("v=%v\n", v)
		fmt.Printf("d=%v\n", d)
	}
	fmt.Printf("d=%v\n", d) // undefined: d
	
}
```

#### 1.6 形参是函数类型

> 函数传入的形参时需要指定类型，形参的类型除了`int`/`string`/`boolean`，还可以是函数类型
>

> 那什么是函数类型？下面代码展示了什么是函数类型
>
> - 从`main`函数可以看出
>   - `f1`函数的类型是`func()`
>   - `f2`函数的类型是`func() int`
>   - `f3`函数的类型是`func(int, string) int`
> - 所以函数类型是什么依据与函数定义时，设置的形参类型和返回值类型

```go
package main

import (
	"fmt"
)


func f1() {
	fmt.Printf("这是f1")
}

func f2() int {
	x := 4
	return x
}

// 函数作为参数传入到函数里
func f3(x int, y string) int{
	fmt.Printf("x=%v\n", x)
	fmt.Printf("y=%v\n", y)
	ret := 33
	return ret
}


func main() {
	f1 := f1
	fmt.Printf("f1 = %v\n", f1) // f1的内存地址：0x108b480
	fmt.Printf("f1 Type is:%T\n", f1) // f1函数的类型: func()
	
	f2 := f2
	fmt.Printf("f2 = %v\n", f2) // f2的内存地址：0x108b4e0
	fmt.Printf("f2 Type is:%T\n", f2)// f2函数的类型: func() int
	
	f3 := f3
	fmt.Printf("f3 = %v\n", f3) // f3的内存地址：0x108b4e0
	fmt.Printf("f3 Type is:%T\n", f3)// f3函数的类型: func(int, string) int
}
```

> 知道了函数类型是什么，那么就可以将函数类型作为形参的一种类型传入函数中
>
> - 下面代码的函数`f3`定义时，给形参`x`指定的类型是`func() int`,
>   - `func() int`类型就表示形参`x`的类型是一个函数类型，并且这个函数类型本身是没有形参传入，但是有一个`int`型的返回值
>   - 执行`x()`就相当于是在执行`func() int`这个类型的函数
>     - `func() int`函数有一个返回值是2，那么`x()`的结果就是`4`,所以函数`f3`里的`ret`值就是`4`,并且`ret`是整型，所以可以作为函数`f3`的返回值

```go
package main

import (
	"fmt"
)


func f1() {
	fmt.Printf("这是f1")
}

func f2() int {
	x := 4
	return x
}

// 函数作为参数传入到函数里
func f3(x func() int) int{
	ret := x()
	return ret
}


func main() {
	f1 := f1
	fmt.Printf("f1 = %v\n", f1) // f1的内存地址：0x108b480
	fmt.Printf("f1 Type is:%T\n", f1) // f1函数的类型: func()
	
	f2 := f2
	fmt.Printf("f2 = %v\n", f2) // f2的内存地址：0x108b4e0
	fmt.Printf("f2 Type is:%T\n", f2)// f2函数的类型: func() int
	
	f3 := f3(f2)
	fmt.Printf("f3 = %v\n", f3) // f3的内存地址：0x108b4e0
	fmt.Printf("f3 Type is:%T\n", f3)// f3函数的类型: func(int, string) int
}
```

#### 1.7 函数返回值是函数类型

> 形参的类型可以使函数类型，那么函数返回值也可以是函数类型
>
> `func() int`是一种函数类型，作为了函数返回值，那么最后在`f3`返回时，就可以把符合`func() int`类型的返回值的函数返回，比如`f1`函数

```go
package main

import (
	"fmt"
)


func f1() int{
	return 33
}

func f2() int {
	x := 4
	return x
}

// 函数作为参数传入到函数里
// 返回值是函数类型
func f3(x func() int) func() int{
	return f1
}


func main() {
	f1 := f1
	fmt.Printf("f1 = %v\n", f1) // f1的内存地址：0x108b480
	fmt.Printf("f1 Type is:%T\n", f1) // f1函数的类型: func()
	
	f2 := f2
	fmt.Printf("f2 = %v\n", f2) // f2的内存地址：0x108b4e0
	fmt.Printf("f2 Type is:%T\n", f2)// f2函数的类型: func() int
	
	f3 := f3(f2)
	fmt.Printf("f3 = %v\n", f3) // f3的内存地址：0x108b4e0
	fmt.Printf("f3 Type is:%T\n", f3)// f3函数的类型: func(int, string) int
}
```

#### 1.8 匿名函数

> - `匿名函数`出现的原因：在函数内部没法声明一个带名字的函数，但是可以声明匿名函数
> - `匿名函数`定义：
>   - 声明函数时，没有指定函数名的函数叫匿名函数
> - `匿名函数`出现的时机：一般都用在`函数内部`
> - 如果函数只调用一次，那么匿名函数可以是`立即执行函数`
>   - 立即执行函数就是在匿名函数定义后的后面放上括号表示立即执行
> - 注意：
>   - 匿名函数是不指定函数名，但是可以`带形参`和`返回值`

```go
package main

import "fmt"

func main() {
	// 声明匿名函数
	// 在函数内部定义
	f1 := func(a, b int) int{
		c := a + b
		return c
	}
	ret := f1(10,20)
	fmt.Printf("ret: %v\n", ret)
	
	// 如果是执行调用一次，可以定义成立即执行函数
	func (x, y int) {
		z := x + y
		fmt.Printf("z = %v\n", z)
	}(12,14)
}
```

#### 1.9 函数闭包

> `函数闭包`是指：函数与外部变量的引用，就叫闭包
>
> 闭包是一个函数，这个函数包含了他外部作用域的一个变量

##### 1.9.1 类比替换形参为函数类型

> 在作用域概念里，当前函数内部引用变量时，优先在自己的函数内部找，没有找到的话，就在函数外层找
>
> - 那么类型到下面的`closeBag`函数就可以看到：
>
>   - `tmp`变量接收一个匿名函数，里面打印一个变量`x`，这个变量在这个匿名函数里没有，就会往外层找，
>
>   - 可以看到外层函数的形参就是有一个变量`x`，那么打印的就是这个形参`x`的值
>   - 从返回值可以看到变量`tmp`的值是匿名函数的`指针`(内存地址)，并且`tmp`的类型是`func()`,是一个函数类型，那么`tmp`加上括号就在执行这个匿名函数

```go
package main

import "fmt"

func main() {
	closeBag(3)
}

func closeBag(x int) {
	tmp := func() {
		fmt.Printf("tmp匿名函数: %v", x)
	}
	fmt.Printf("tmp值: %v\n", tmp) // 0x4965c0
	fmt.Printf("tmp带类型说明的值:%#v\n", tmp) // (func())(0x4965c0)

	// 表示在执行tmp这个匿名函数
	tmp() // tmp匿名函数: 3
}

/* 执行结果:
	tmp值: 0x4965c0
	tmp带类型说明的值:(func())(0x4965c0)
	tmp匿名函数: 3
*/
```

> 那么最外层的形参`x`可以是`int`类型，`x`类型替换一下就可以是`函数类型`
>
> - 要传入一个形参是函数类型，就必须先有一个这样的函数，才可以在`main`函数中进行调用，执行后才可以看到最终的效果
>   - 因为在函数`closeBag`中传入的函数类型是`func(int, int)`,那么定义这种类型的函数就是`f1`
>   - 另外`f1`函数需要接收两个`int`形参，那么在`closeBag`函数中的`tmp`匿名函数时就需要将这两个`int`形参定义
> - 然后执行`closeBag`函数时，除了需要传入符合的函数类型`func(int, int)`外，还需要传入两个`int`变量`a和b`，因为他内部的`x`需要接收两个`int`形参
> - 最后可以看到执行的结果：
>   - 先打印了： `f1函数的内部地址:0x496460`
>   - 接着打印了: `tmp值: 0x496730`
>     - 可以看到tmp的内存地址是他自己的匿名函数的内存地址
>   - 继续打印： `tmp带类型说明的值:(func())(0x496730)`
>     - 可以看到tmp的类型是`func()`,表示他是一个匿名函数类型
>   - 继续打印： `tmp匿名函数中的x: 0x496460`
>     - 注意看这里的x是`tmp`匿名函数里传入的变量`x`,并且这个变量x的值是一个指针(函数内存地址)，该`x`的值和`f1`函数的内存地址一致，那就说明`x`等价于`f1`,所以执行`x(a,b)`就等价于执行`f1(a,b)`函数
>   - 继续打印：`tmp匿名函数中的x: (func(int, int))(0x496460)`
>     - 可以看到`x`的类型是`func(int, int)`,值是`0x496460`，和`f1`函数的内存地址一致
>   - 最后打印：`4 + 5 = 9`
>     - 这里就是在执行`f1`函数里的代码
> - 至此可以看出`tmp`匿名函数就是闭包，接收外部喊出传入的参数，传入的参数类型可以使基础数据类型，也可以是函数类型

```go
package main

import "fmt"

func main() {
	fmt.Printf("f1函数的内部地址:%v\n",f1)
	closeBag(f1, 4, 5)
}

// 因为要传入一个函数类型是: func(int, int)
// 需要先定义一个符合这个类型条件的函数
func f1(a, b int) {
	fmt.Printf("%v + %v = %v\n", a, b, a + b)
}

func closeBag(x func(int, int), a, b int) {
	tmp := func() {
		fmt.Printf("tmp匿名函数中的x: %v\n", x)
		fmt.Printf("tmp匿名函数中的x: %#v\n", x)
		x(a, b)
	}
	fmt.Printf("tmp值: %v\n", tmp)
	fmt.Printf("tmp带类型说明的值:%#v\n", tmp)

	// 执行tmp这个匿名函数
	tmp()
}

/*
	执行结果：
		f1函数的内部地址:0x496460
        tmp值: 0x496730
        tmp带类型说明的值:(func())(0x496730)
        tmp匿名函数中的x: 0x496460
        tmp匿名函数中的x: (func(int, int))(0x496460)
        4 + 5 = 9
*/
```

##### 1.9.2 闭包例子

> 下面是闭包函数例子的一个分析

> - 下面的`addr`函数：
>   - `addr`函数自身是没有形参，`addr`函数的返回值是函数类型(`func(int) int`)，表示返回值的类型是一个函数类型，并且这个函数类型返回值自身是先形参接收一个`int`变量，然后返回值是一个`int`
>   - `addr`函数内部定义了一个`int`的`x`,赋值为`100`
>   - 使用变量`tmp`接收一个带形参以及返回值的匿名函数，最后将`tmp`值`return`返回
> - 从`addr`函数执行结果来看
>   - `ret`就是`tmp`，是`addr`函数内部定义的`tmp`这个匿名函数的内存地址，并且该匿名函数符合`func(int) int`函数类型，所以`tmp`的值是一个函数内存地址
>   - 因为`ret`的值是一个函数的内存地址，当拿到了`ret`的内存地址，要执行`ret`函数，那就按`ret`函数接收形参和返回值的格式输入对应的形参值，就可以得到返回值了
>   - 执行`ret`函数，其实就是在执行`tmp`函数，相当于执行`ret(y int) int`,就是在执行``ret(y int) int`这个函数，只需要传入给函数对应的`y`参数就可以了
>   - 最后因为`x`是100，`y`是传入的200，最后`addr`函数执行结果就是：`100 + 200 = 300`

```go
package main

import "fmt"

func main() {
	ret := addr()
	fmt.Printf("main方法执行 ret的值和类型: %#v\n", ret)

	data := ret(200)
	fmt.Printf("data是:%v\n", data)
}

func addr() func(int) int {
	var x int
	x = 100
	tmp := func(y int) int {
		x += y // x += y 等价于 x = x + y
		return x
	}

	fmt.Printf("addr函数内部 tmp的值和类型: %#v\n", tmp)
	return tmp
}

/*
	执行结果：
		addr函数内部 tmp的值和类型: (func(int) int)(0x496610)
        main方法执行 ret的值和类型: (func(int) int)(0x496610)
        data是:300
*/
```

> 既然可以在`addr`里面定义`x`，那就可以将`x`提出来，放到`addr`函数的形参里，这样是把`x`写活了，可以穿入任意的整数值
>
> 再次执行`addr`函数可以看到执行结果和上面的一样

```go
package main

import "fmt"

func main() {
	ret := addr(100)
	fmt.Printf("main方法执行 ret的值和类型: %#v\n", ret)

	data := ret(200)
	fmt.Printf("data是:%v\n", data)
}

func addr(x int) func(int) int {
	tmp := func(y int) int {
		x += y // x += y 等价于 x = x + y
		return x
	}

	fmt.Printf("addr函数内部 tmp的值和类型: %#v\n", tmp)
	return tmp
}

/*
	执行结果:
		addr函数内部 tmp的值和类型: (func(int) int)(0x496610)
        main方法执行 ret的值和类型: (func(int) int)(0x496610)
        data是:300
*/
```

> 既然`x`可以放到`addr`函数的形参里，并且类型是`int`，那么就可以对`x`类型替换为`函数类型`
>
> 分析传入形参是函数类型的`addr`函数:
>
> -  

```go
package main

import "fmt"

func main() {
	fmt.Printf("main方法里的f1函数: %#v\n", f1)

	ret := addr(f1, 100, 200)
	fmt.Printf("main方法执行 ret的值和类型: %#v\n", ret)

	data := ret(200)
	fmt.Printf("data是:%v\n", data)
}

func f1(a int, b int) int {
	return a + b
}

func addr(x func(int, int) int, a int, b int) func(int) int {
	tmp := func(y int) int {
		fmt.Printf("tmp匿名函数中的x: %#v\n", x)
		ret := x(a, b) + y
		return ret
	}

	fmt.Printf("addr函数内部 tmp的值和类型: %#v\n", tmp)
	return tmp
}

/*
        执行结果:
           main方法里的f1函数: (func(int, int) int)(0x496570)
           addr函数内部 tmp的值和类型: (func(int) int)(0x4966b0)
           main方法执行 ret的值和类型: (func(int) int)(0x4966b0)
           tmp匿名函数中的x: (func(int, int) int)(0x496570)
           data是:500
*/
```





```go
package main

import (
	"fmt"
	"strings"
)

func f1() {
	fmt.Printf("this is from f1\n")
}

func f2(x, y int) int {
	z := x + y
	return z
}

func f3(f func()) {
	fmt.Printf("this is from f1\n")
	// 这里执行closeBag返回的匿名函数
	f()
}

func closeBag(f func(int, int) int, x int, y int) func() {
	temp := func() {
		// 这里会执行符合条件的f2函数
		ret := f(x, y)
		fmt.Printf("ret:%v\n", ret)
	}
	return temp
}

func fileSuffixData(sufstr string) func(string) string{
	temp := func(name string) string {
		if ! strings.HasSuffix(name, sufstr) {
			fmt.Printf("文件不是以%v结尾的\n", sufstr)
			fmt.Printf("传入的name:%v \t 传入的sufstr:%v\n", name, sufstr)
			name = name + sufstr
		} else {
			fmt.Printf("文件是以%v结尾的\n", sufstr)
		}
		return name
	}
	fmt.Printf("temp的值:%v\n", temp)
	return temp
}

func main() {
	// 直接执行f1函数
	f1()
	
	f1 := f1
	fmt.Printf("f1: %v\n", f1)
	fmt.Printf("f1: %#v\n", f1)
	fmt.Printf("f1的类型: %T\n", f1) //func()
	
	fmt.Println("\n\n执行闭包函数！！！！\n")
	closeBag := closeBag(f2, 10, 10)
	fmt.Printf("closeBag: %v\n", closeBag)
	fmt.Printf("closeBag Type is: %T\n", closeBag)
	
	f3(closeBag)
	
	jpgSuffix := fileSuffixData(".jpg")
	fmt.Printf("jpgSuffix值是:%v\t jpgSuffix的类型是:%T\n", jpgSuffix, jpgSuffix)
	fmt.Printf("ret:%v", jpgSuffix("name"))
}


```















































#### 1.x 函数`defer`

> 













































































































































## 九、练习题例子

#### 1、 练习题1

> 统计字符串里中文字符出现的次数

```go
package main

import (
	"fmt"
	"unicode"
)

func main() {
	// 判断字符串中汉字的字符数量
	// 思路：
	// 1、拿到字符串的字符
	// 2、判断字符串是否是汉字
	// 3、然后统计中文字符出现的次数
	s := "hello新年是新的年"
	
	ret := 0
	// 1、拿到字符串的字符
	for _, v := range s {
		// 2、判断字符串是否是汉字
		if unicode.Is(unicode.Han, v) {
			ret += 1
		} else {
			continue
		}
	}
	
	fmt.Printf("中文字符出现次数:%v\n", ret) // 6
	
}



```

