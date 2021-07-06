### 一、JS介绍

#### 1、js概念

> javascript是脚本语言，浏览器会有一个js解释器，对js代码逐行进行解释后执行

#### 2、js组成

> js由三部分组成，如下三部分
>
> - ECMAScript： javascript语法，规定了js的编程语法和基础核心知识，是所有浏览器需要保持的一个标准
> - DOM：页面文档对象模型
> - BOM：浏览器对象模型，控制浏览器的行为，弹出弹窗、打开页面等等、

#### 3、js的位置

- 有三种写法，详细看代码，分为行内、内嵌、外部js

- 注意：外部js的两个`script`标签之间不可以写内容

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>day2</title>
      <script>
          // 内嵌式js
          alert('内嵌式js')
      </script>
  </head>
  <body>
      <!-- 行内式js -->
      <input type="button" value="点我" onclick="alert('点我了')">
  </body>
  <!-- 外链式 -->
  <script src="index.js"></script>
  </html>
  ```

#### 4、js注释

```html
单行注释:  
// 单行注释

多行注释: 
/* 多行注释*/
```

#### 5、js输入输出

> alert('msg'):  浏览器的弹出框
>
> console.log('msg'): 控制台打印输出
>
> prompt('msg'): 浏览器提示输入



### 二、js基础语法

#### 1、变量

- 声明变量：  `var  age;`

- `var`是`js`的一个关键字，用来声明变量（`variable`变量的意思），使用这个关键字，会自动分配内存空间

- 变量初始化：先声明再赋值

```js
var  age;
age = 18;
console.log(age) // 18
```

- 变量只声明不赋值：返回结果是`undefined`，表示没有给值，是未定义的变量

```js
var  age;
console.log(age) // undefined
```

- 变量不声明不赋值直接使用会报错

```js
console.log(tr); // 提示 tr没有被定义的报错
```

- 变量直接赋值使用不声明，可以使用，不过不推荐该方法，应该要用关键字`var`来声明变量

```js
qq = 123;
console.log(qq);
```

- 更新变量

```js
var  age;
age = 18;
age = 20;
console.log(age) // 20
```

- 变量交换值

```js
var tmp; // 临时变量
var num1 = 10;
var num2 = 20;

// 1.将tmp等于num1的值
tmp = num1;
// 2.将num1等于num2的值
num1 = num2
// 3.将num2等于tmp的值
num2 = tmp

// 输出num1、num2
console.log(num1); // 20
console.log(num2); // 10
```

#### 2、数据类型

> js的数据类型是在程序运行时自动判断的，也就是自动推导数据类型
>
> js数据类型分类：
>
> - 简单数据类型：`Number`、`String`、`Boolean`、`Null`、`Undefined`
> - 复杂数据类型：`Object`

##### 2.1 数值型number

> 包含整型和浮点型，默认值是`0`

```js
var num = 10;
console.log(num); // 10

// 数字型最大值
console.log(Number.MAX_VALUE);

// 数字型最小值
console.log(Number.MIN_VALUE);
```

```js
// 下面内容作为了解
alert(Infinity);  // 无穷大
alert(-Infinity);  // 无穷小
alert(NaN);  // 非数字，Not a Number
```

```js
// isNaN(variable) 这个方法用来判断非数字，并且返回一个值，如果是数字，返回false，不是数字，返回的是true
console.log(isNaN(123)) // 输出false
console.log(isNaN('test nova')); // 输出true
```



##### 2.2 布尔类型boolean

> 布尔类型，结果为`true`、`false`对应数字`1`和`0`，可以用来加法运算

```js
// true  表示真
var flag_t = true;
console.log(flag_t); // true

// false 表示假
var flag_f = false;
console.log(flag_f); // false

// 布尔类型参与运算，true = 1，false = 0
console.log(true + 1); // 输出 2
console.log(false + 1); // 输出 1
```



##### 2.3 字符串型String

> 字符串类型，需要带引号
>
> `\n` 表示换行

```js
var str = '这是一个字符串\n变量'
console.log(str); // 输出: 这是一个字符串变量
```

```js
// 字符串的长度
var str = '我是谁';
console.log(str.length); // 3
```

```js
// 字符串的拼接
var str1 = 'harry';
var str2 = 'potter'
var str3 = str1 + str2;
console.log(str3); // 输出：harrypotter

// 字符串的拼接，只要有字符串和其他类型拼接，都会展示为字符串类型
console.log(12 + 'jim'); // 输出: 12jim
```



##### 2.4 undefined

> `var age;`只声明变量不赋值，就是未定义类型，此时`age`的值是`undefined`

```js
var age;
console.log(age); // 输出: undefined

console.log(age + 'ko'); // 输出: undefinedko

// undefined和数字相加，不是一个数字
console.log(age + 1); // 输出 NaN
```



##### 2.5 null类型

> `var age=null;`声明变量是一个空值，默认值是`null`

```js
var age = null;
console.log(age); // 输出: null

console.log(age + 'ko'); // 输出: nullko

// null和数字相加，输出数字，空值表示完全是空的
console.log(age + 1); // 输出 1
```



##### 2.6 检测数据类型

```js
var age = 10;
console.log(typeof age); // 输出: number

var age_1 = 'this is js';
console.log(typeof age_1); // 输出: string

var age_2 = true;
console.log(typeof age_2); // 输出: Boolean

var age_3;
console.log(typeof age_3); // 输出: undefined

var age_4 = null;
console.log(typeof age_4); // 输出: object (后面再学对象时有用)
```

#### 3、数据类型转换

##### 3.1 转换为字符型



