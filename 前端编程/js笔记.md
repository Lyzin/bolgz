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



### 二、数据类型

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

> `age.toString()` 不常用
>
> `String(age)`不常用
>
>  `+`号拼接,数字加一个空字符串，就可以变为字符串类型（<font style="color: red">常用</font>）

```js 
// toString() 不常用
var age = 18;
console.log(age.toString());  // 18
console.log(typeof age.toString());  // string

// String() 不常用
var age_1 = 18;
console.log(String(age_1));  // 18
console.log(typeof age_1.toString());  // string

// +号拼接,数字加一个空字符串，就可以变为字符串类型
var age_2 = 18
var age_3 = age + '';
console.log(age_3);  // 18
console.log(typeof age_3);  // string
```

##### 3.2 转换为数字

- `parseInt(string)` 转换为整数型

```js
// parseInt(string) 转换为整数型，得到的是一个整数
var sex = '123';
var sex_int= parseInt(sex);
console.log(sex_int);  // 123
console.log(typeof sex_int); // number

// parseInt(string) 只会取整数部分，不会走四舍五入
var sex_1 = '3.14'
var sex_2 = '3.94'
console.log(parseInt(sex_1)); // 3
console.log(parseInt(sex_2)); // 3

// parseInt(string) 可以用来取像素整数，只会取到数字部分，但是开头是非数字的取时会显示为非数字，结果为NaN
var sex_3 = '314px'
var sex_4 = 'rem314px'
console.log(parseInt(sex_3)); // 314
console.log(parseInt(sex_4)); // NaN
```

- `parseFloat(string)`转换为浮点型

```js
// parseFloat(string) 转换为浮点型，得到的是一个整数
var sex = '123';
var sex_int= parseFloat(sex);
console.log(sex_int);  // 123
console.log(typeof sex_int); // number

// parseFloat(string) 转换为浮点型，不会走四舍五入
var sex_1 = '3.14'
var sex_2 = '3.94'
console.log(parseFloat(sex_1)); // 3.14
console.log(parseFloat(sex_2)); // 3.94

// parseFloat(string) 可以用来取像素整数，只会取到数字部分，但是开头是非数字的取时会显示为非数字，结果为NaN
var sex_3 = '314.34px'
var sex_4 = 'rem314.34px'
console.log(parseFloat(sex_3)); // 314.34
console.log(parseFloat(sex_4)); // NaN
```

- 隐式转换为数字，支持 `-`、`*`、`/`

```js
var age = '12';
var age_int = age - 0;
console.log(age_int); // 12
console.log(typeof age_int); // number 
```

##### 3.3 转换为布尔类型

```js
console.log(Boolean('')); // false
console.log(Boolean(0)); // false
console.log(Boolean(null)); // false
console.log(Boolean(undefined)); // false
console.log(Boolean(NaN)); // false
console.log(Boolean('this is js')); // true
console.log(Boolean(13)); // true
```



#### 4、运算符

##### 4.1 算术运算符

> 就是`加`、`减`、`乘`、`除`、`取余`、`浮点数`

```js
// 加
console.log(1 + 1); // 2
// 减
console.log(1 - 1); // 0
// 乘
console.log(1 * 1); // 1
// 除
console.log(1 / 1); // 1
// 取余
console.log(1 % 1); // 0  
// 浮点数相加会有精度问题，不建议浮点数直接相加
console.log(0.1 + 0.2); // 0.30000000000000004
```

##### 4.2 表达式和返回值

```js
// 1+1 是表达式，1+1 的结果是2 2是返回值
var sum = 1 + 1;
console.log(sum); // 2
```

##### 4.3 前置递增运算符

> 格式： `++num`
>
> 定义： 让一个变量自己`+1`
>
> 概念：`++num`在运算时，先加`1`，再返回值

```js
// 原始变量自己+1
var num = 1;
num = num + 1;
console.log(num); // 2

// 上述变法比较麻烦，可以用 ++num(前置递增运算符)
// ++num 等同于 num = num +1
var num_2 = 2;
++num_2
console.log(num_2);  // 3

// ++num在运算时，先加1，再返回值
var num_3 = 3;

// 下面结果是5，因为++num_3 + 1 运算时是先进行了+1，此时
// ++num_3 的值是4，4再+1就是5
console.log(++num_3 + 1);  // 5
console.log(num_3); // 4
```

##### 4.3 后置递增运算符(<font style='color:red'>常用</font>)

> 格式： `num++`
>
> 定义： 让一个变量自己`+1`
>
> 概念：`num++`在运算时，先返回`num`原值，再`+1`
>
> 需要注意: 当 `num++ `单独使用时，返回值和`num++`效果一样，不单独使用时，num++`返回的是`num`这个变量的原值

```js
var num = 10;

// 当num++单独使用时,效果和++num一样,所以下面这个表达式的结果是10+1=11,此时num=11
num++;
console.log(num); // 11

// 下面用num++ + 2时，num++先返回原值，此时num的原值就是11，所以下面的表达式结果就是11+2=13
console.log(num++ + 2); // 13
```

#####  4.4 比较运算符

> 大于： `>`
>
> 小于： `>`
>
> 大于等于： `>=`
>
> 小于等于： `<=`
>
> 等于2个等于号： `==` ，默认会进行数据类型转换，会把字符串类型转换为数字型
>
> 不等于： `!=`
>
> 全等：`===`，两个比较的值和数据类型一样，才是true

```js
// 大于 >
console.log(3 > 4); //false  

// 小于 >
console.log(3 < 4); // true

// 大于等于 >=
console.log(3 >= 4); //false  

// 小于等于 <=
console.log(3 <= 4); //true

// 等于2个等于号 == ，默认会进行数据类型转换，会把字符串类型转换为数字型，属于隐式转换
console.log(3 == 5); //false 
console.log('sum' == 'bob'); //false 
console.log(13 == 13); //true
console.log(13 == '13'); //true
console.log(13 == '13px'); // false
console.log(13 == 'rem13px'); // false

// 不等于 !=
console.log(3 != 5); // true 
console.log('sum' != 'bob'); // true 
console.log(13 != 13); // false
console.log(13 != '13'); // false
console.log(13 != '13px'); // true
console.log(13 != 'rem13px'); // true

// 全等 ===
console.log(3 === 5); //false 
console.log('sum' === 'bob'); //false 
console.log(13 === 13); // true 
console.log(13 === '13'); //false 
```

##### 4.5 逻辑运算符

> 逻辑与：代码符号`&&`，表示and的意思
>
> 逻辑或：代码符号`||`，表示or的意思
>
> 逻辑非：代码符号`!`，表示not的意思

```js
// 逻辑与：代码符号 && ，表示and的意思，两侧都为true，结果才是true，只要有一侧为false，结果为false
console.log( 3 < 5 && 4 > 5); // false
console.log( 3 < 5 && 4 < 5); // true

// 逻辑或：代码符号 ||，表示or的意思，两侧都为false，结果才是false，只要有一侧为true，结果为true
console.log( 3 < 5 || 4 > 5); // false
console.log( 3 < 5 || 4 < 5); // true

// 逻辑非：代码符号 ！，表示not的意思，表示非的意思，会将true的变为false，然后把false变为true
console.log( !(4 > 5) ); // true  4大于5 是false，然后逻辑非加上，就变成了true
console.log( !(4 < 5) ); // false 4小于5 是true，然后逻辑非加上，就变成了false
```

- 逻辑与运算符号的中断/短路逻辑

> 原理：当有多个表达值时，左边的表达式值可以确定结果时，就不需要计算右边的表达式

```js
// 因为是中断，所以逻辑运算符后面的不再进行计算
// 如果表达式1为真，则返回表达式2   如果表达式1为假，则返回表达式1
console.log(123 && 456); // 456
console.log(0 && 456); // 0在js中表示false
console.log(0 && 1 + 2 && 456 + 789); // 0在js中表示false
```

- 逻辑或运算符号的中断/短路逻辑

> 原理：当有多个表达值时，左边的表达式值可以确定结果时，则返回左边的表达式

```js
// 因为是中断，所以逻辑运算符后面的不再进行计算
// 如果表达式1为真，则返回表达式1   如果表达式1为假，则返回表达式2
console.log(123 || 456); // 123
console.log(0 || 456); // 456
console.log(0 || 1 + 2 || 456 + 789); // 3，因为0是false，所以此时返回1+2的结果3，但是3是true，所以和（456+789）或的时候返回3

var num = 0;
console.log(123 || num++);
console.log(num); // 0 因为上面的逻辑或运算，由于123是true，所以返回了123，后面的num++不会运行，所以num的值仍是0
```

##### 4.6 赋值运算符

> 直接赋值：`=`
>
> 加减一个数后再赋值：`+=`、`-=`
>
> 乘除取模后再赋值：`*=`、`/=`、`%=`

```js
// 赋值运算符
var num = 1;

// num++ 和 += 的区别
// num++ 只能每次加+1
//  += 可以每次加N
// -= 、*= 、 /= 、 %= 同理
var num_t = 3;
num_t += 3 // 每次可以+3，等同于  num_t = num_t + 3  , num_t = 6
console.log(num_t); // 6
```

##### 4.7 运算符优先级

> 优先级  运算符解释  符号
>
> 1  小括号：`()` 
>
> 2  一元运算符 `++` `--` `!`
>
> 3  算数运算符 先`*`   `/`    `%`后 `+` `-`
>
> 4  比较运算符  `>` `>=` `<=`
>
> 5  相等运算符  `==` `!=` `===` `!==`
>
> 6  逻辑运算符 条件表示式有`&&`和`||`先计算`&&` 再计算`||`
>
> 7  赋值运算符 `=`
>
> 8 逗号运算符 `,`	   

### 三、流程控制

> 分支流程控制和其他编程语言相同，不做过多介绍，只记录语法

#### 1、if-else分支

```js
// if 格式，条件表达式为true，执行if判断里的语句代码，条件表达式为false，则执行else代码
// if (条件表达式) {
//   statement;    
// } else {
//   statement
// }

if (3 > 1) {
    console.log('3 > 1');
} else {
  	console.log('3 < 1');
}

// output  : '3 > 1'
```

- 案例：判断闰年

```js
var year = 2013;

if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    console.log(year + '年是闰年');
} else {
    console.log(year + '年不是闰年');
} 

// output
// 2013年不是闰年
```

#### 2、if-else if -else 语句

> 这个是多条件语句
>
> `else if`是需要跟一个条件表达式的

```js
var year = 88;

if (year > 90) {
    console.log('90 score');
} else if (year > 80) {
    console.log('80 score');
} else {
    console.log('小于80score');
}
// output
// 80 score
```

#### 3、三元表达式

> 用来做一些简单的`if-else`判断
>
> 格式： 条件表示式 ? 表达式1 : 表达式2
>
> 解释：条件表达式为真，则返回表达式1的值，如果条件表达式为假，则返回表达式2的值

```js
var sum = 10;

var ret = sum > 6 ? '大于6' : '小于6';

console.log(ret);

// output
// 大于6

// 数字补0,大于10不用补0.小于10需要补0
var num = '9';
var ret = num < 10 ? '0' + num : num;

console.log(ret);  // 09
console.log(typeof ret); // string
```

#### 4、switch语句

> 解释：多个值来匹配`case`
>
> 语法格式：
>
> ```js
> switch (表达式) {
>   case va1ue1:
>     statement;
>     break;
>   case va1ue2:
>     statement;
>     break;
>   ...
>   default:
>   	statement;
>     break;
> }
> ```
>
> `switch`语法注意事项：
>
> - `switch`语句里的表达式是一个准确的值，经常是一个变量
> - 与`case`后面的值匹配时是全等匹配，既需要判断值是否相等，还要看数据类型是否相等

```js
var num = 9;

switch (num) {
    case 1:
        console.log('>>1');
        break;
    case 2:
        console.log('>>2');
        break;
    case 9:
        console.log('>>9');
        break;
    default:
        console.log('not found!');
        break;
}
```

- `switch`和`if - else`的区别
  - `switch`语句处理`case`比较确定的情况，`if else `更灵活，用于处理判断(大于、小于等判断条件)
  - `switch`语句进行条件判断后直接执行程序的语句，效率高，`if else`语句条件的判断条件比较多，需要不断进行匹配
  - `switch`语句适用于分支比较多的情况，`if-else`适用于分支较少的情况

#### 5、循环语句

##### 5.1 for 循环

> `for`循环语句格式
>
> for循环的里条件表达式条件走完以后，就会退出循环

```js
for (var i = 0; i <= 10; i++){
    console.log('i = ' + i);
}
// ouput:
// i = 0
// i = 1
// i = 2
// i = 3
// i = 4
// i = 5
// i = 6
// i = 7
// i = 8
// i = 9
// i = 10
```



























