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

- `var`是js的一个关键字，用来声明变量（variable变量的意思），使用这个关键字，会自动分配内存空间

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

- 变量直接赋值使用不声明，可以使用，不过不推荐该方法，应该要用关键字var来声明变量

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

##### 2.1 数值型number



##### 2.2 字符串型String

