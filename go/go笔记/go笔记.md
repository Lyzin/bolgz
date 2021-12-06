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
>   变量名 类型
>   变量名 类型
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
>
> - `%#v` : 输出变量并且与变量的类型
>
> - `%T`: 查看变量的类型
> - `%s`:输出字符串
> - `%d:`输出数字

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
> 4、默认`GO`语言的小数都是`float64`
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
> `Go`语言中字符串必须是双引号`(")`，单引号`(‘)`表示字符

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

	// 判断前缀是否是以hi开头
	s2 := strings.Index(s1, "h")
	fmt.Printf("%v\n", s2) // 0

	// 判断后缀是否是以gos结尾
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
	// 再将数组join成字符串
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



## 五、流程控制

### 1、if语句

> 常见的`if`判断语句
>
> 格式：
>
> ```go
> if 表达式 {
>   		语句1
> } else {
>   		语句2
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

> 可以将变量写到if判断里
>
> 可以减少内存占用
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
5
6
7
8
9
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
5
6
7
8
9
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

// 结果
i = 1
i = 2
i = 3
i = 4
i = 6
i = 7
i = 8
i = 9
// 可以看到5被跳过不输出
```

### 7、switch

> 简化大量判断
>
> 当大量`if`需要判断某个变量等于某个值，然后执行一些功能块时，就可用`switch`语句来简化代码
>
> `switch`和`case`两个关键字是同一列，不需要case在switch下缩进

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

> 常见的加减乘除

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
	
	//按位与 (两位都为1才为1)
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

	//按位与 (两位有一个为1就为1)
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

	//按位异或 (两位不一样就为1)
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

> 类比计算比输入值增加的例子，例如：计算器里输入数字，比如数字23
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
> 同理`2<<2`表示将2的二进制表示向左移2位，也就是由`10`变成了`1000`，也就是十进制的8。

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

## 七、复合数据类型

### 1、数组

> 类似于其他语言的列表，比如`python`的`list`、`shell`语言的数组
>
> 常用来存储元素的

```go
// 
```







