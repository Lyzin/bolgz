## 一、Web框架

### 1、web框架的底层理解

> 从手动创建一个`web`框架开始

```python
# 网络协议
HTTP协议    数据传输明文协议
HTTPS协议   数据传输密文协议
websock协议 数据传输密文协议

# HTTP四大特性
1. 基于请求、响应
2. 基于TCP/IP作用于应用层之上的协议
3. 无状态
4. 短/无链接

# HTTP数据格式
请求首行
请求头
请求行

# 响应状态码
1XX
2XX
3XX
4XX
5XX
```

#### 1.1 实现一个Http的服务端

```python
import socket

server = socket.socket()
server.bind(("127.0.0.1", 8000))

# 池子
server.listen(5)

while True:
    conn, addr = server.accept()

    # 接收客户端的请求数据,客户端可以是浏览器，请求相关的所有信息
    data = conn.recv(1024)
    print(f"recv data:{data}")
    print("data type is:",type(data))
    conn.send(b"HTTP/1.1 200 OK\r\n\r\nhello web")
    conn.close()
```

- 浏览器打开`http://127.0.0.1:8080`

> 终端内有两条请求记录，目前只关心`GET /` 这一条，`/favicon.ico`暂时不关心

![image-20211025193840271](django%E7%AC%94%E8%AE%B0.assets/image-20211025193840271.png)

```python
 print(f"recv data:{data}")
 print("data type is:",type(data))  # <class 'bytes'>
# 上面两行代码返回的data结果
 """
    b'GET / HTTP/1.1\r\n
    Host: 127.0.0.1:8001\r\n
    Connection: keep-alive\r\n
    Upgrade-Insecure-Requests: 1\r\n
    User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\r\n
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9\r\n
    Sec-Fetch-Site: none\r\n
    Sec-Fetch-Mode: navigate\r\n
    Sec-Fetch-User: ?1\r\n
    Sec-Fetch-Dest: document\r\n
    Accept-Encoding: gzip, deflate, br\r\n
    Accept-Language: zh-CN,zh;q=0.9\r\n
    Cookie: csrftoken=SwCZzdzHFXp8uGWHUqjfrIycQ1P4X6MMo0OG1EhPLPzfMYV1yeSaxmaOEq8GqbXe\r\n\r\n'
    """
```

### 2、wsgiref模块

> Django底层用的还是`wsgiref`模块来请求和响应数据
>
> `wsgiref`模块
>
> 1. 请求来的时候解析`HTTP`格式的数据，封装成大字典
> 2. 响应走的时候给数据打包成符合`HTTP`格式的数据返回给浏览器

### 3、Django安装

> `Django`的版本问题
>
> - `Django1.x`和`Django2.x`的差距不大
> - 所以先学习`Django1.x`的即可，后续有需要可以往`Django2.x`过渡
> - 面试时可以说先用的1.8，慢慢过渡到了1.11版本
> - 因为Django1.11.11最好适合的Python3版本是`3.4~3.6`之间的版本，3.7以及后面的版本和Django的`1.11.11`版本有兼容问题
>   - [pip清华地址:https://mirrors.tuna.tsinghua.edu.cn/help/pypi/](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)

```bash
pip install django==1.11.11

// 查看django版本
(venv) D:\>django-admin version
1.11.11
```

## 二、Django基本操作

> 下面基本都在命令行操作

### 1、创建项目

> `blog`是项目名
>
> 使用`django-admin`可以快速创建一个`Django`项目

```bash
// 创建Django项目的命令
django-admin startproject blog
```

> 创建完以后可以看到项目目录的结构
>
> - 项目根目录有两个东西：
>   - 一个是项目管理文件: `manage.py`
>   - 另一个是目录:`blog`
>
> - `blog`目录中：
>
>   - `setting.py`：项目配置文件
>
>   - `urls.py` ：项目路由文件
>
>   - `wsgi.py` ：项目启动服务文件

### 2、创建应用

> - 一个`app`就是一个功能独立的模块
> - 一个项目可以有多个`app`：比如下面的`home`是就是应用名
>
> - 由于`django 1.11`版本和`python3.7`版本不兼容, 2.0版本以后的Django修复了这个问题，所以使用下面命令创建app就需要注意下python3和Django的版本
>

```bash
# 切换到创建的项目根目录
python manage.py startapp home
```

![image-20211215235855339](django%E7%AC%94%E8%AE%B0.assets/image-20211215235855339.png)

#### 2.1 应用的目录结构

![image-20211216000052168](django%E7%AC%94%E8%AE%B0.assets/image-20211216000052168.png)

#### 2.2 注册应用

> 创建出来的应用一定要先去配置文件中注册，在`setting.py`文件中

```python
# 注册创建的App


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # 'bolg.home',  // 全写
    'home' # 简写，只写应用名
]
```

### 3、项目目录结构介绍

```bash
- blog目录
		- blog目录中：
			 -- setting.py 配置文件
			 -- urls.py  路由与视图函数对应关系（路由层）
			 -- wsgi.py  wsgiref模块（不考虑）
		- manage.py  项目入口文件
		- db.sqlite3 自带数据库，很小，仅仅用来做测试
		- home目录
			 -- admin.py 后台管理
			 -- apps.py 注册使用
			 -- migrations 数据库迁移日志文件
			 -- models.py 数据库模型类，用于ORM
			 -- views.py 视图函数文件
			 -- test.py 测试文件
```

### 4、启动Django项目

```bash
python manage.py runserver
```

![image-20211216000435878](django%E7%AC%94%E8%AE%B0.assets/image-20211216000435878.png)

> 打开浏览器，输入上面的地址打开后可以看到下面页面，就表示启动`Django`成功
>
> 并且可以看到下面的英文提示：
>
> - 第一句(Your're seeing...):表示能看到这个消息，是`Django`项目的`setting.py`文件中的`DEBUG=True`
> - 第二句(you haven't...):表示还没有配置路由`URLS`

![image-20211216000754066](django%E7%AC%94%E8%AE%B0.assets/image-20211216000754066.png)

### 5、`templates`目录

> `templates`目录用来存放前段`HTML`页面的
>
> - 命令行创建`没有templates`文件目录
>
> - pycharm创建是`templates`文件目录的

### 6、Django三组件

#### 6.1 HttpResponse

> 从`HttpResponse`源码可以看：
>
> - 是一个`Http`响应，并且返回的是字符串内容
> - 这个内容可以被读、追加或者替换

![image-20211216002949454](django%E7%AC%94%E8%AE%B0.assets/image-20211216002949454.png)

```python
# 应用中使用,写在views.py中
def index(request):
    """
    :param request: 请求相关的所有的数据
    :return: HttpResponse对象值
    """
    ret = HttpResponse('Hi, index')
    print(ret) # <HttpResponse status_code=200, "text/html; charset=utf-8">
    print(type(ret)) # <class 'django.http.response.HttpResponse'>
    return ret
```

#### 6.2 render

> 给浏览器返回渲染的`html`文件，将`html`文件变成字节形式返回给浏览器

##### 2.1 创建`html`文件

> 需要先在`templates`创建对应的`html`文件
>
> `{{ ret }}`是django自带的模板语法，表示接收变量的值

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    {{ ret }}
</body>
</html>
```

##### 2.2 编写路由

```python
# 在settings.py文件中添加index_html的路由
from django.conf.urls import url
from django.contrib import admin
from day01 import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^index/', views.index),
    url(r'^index_html/', views.index_html),
]
```

##### 2.3 编写视图函数

```python
# 应用中使用,写在views.py中
def index_html(request):
    """
    :param request: 请求相关的所有的数据
    :return: HttpResponse对象值
    """
    ret = 'html page data'
    return render(request, 'index.html', locals())
```

##### 2.4 请求页面

> 访问`http://127.0.0.1:8000/index_html/`即可看到下面的页面

![image-20210903143834317](django%E7%AC%94%E8%AE%B0.assets/image-20210903143834317.png)

#### 3. redirect

> 表示在视图函数中跳转到别的页面，也叫重定向

```python
# 应用中使用,写在views.py中
def index_redirect(request):
    """
    :param request: 请求相关的所有的数据
    :return: HttpResponse对象值
    """
    redirect_url = '/index/'
    return redirect(redirect_url)
```

> 访问`http://127.0.0.1:8000/index_html/`就会最终跳转至`/index/`页面

![image-20210903144432203](django%E7%AC%94%E8%AE%B0.assets/image-20210903144432203.png)

### 7、静态文件配置



### 8、request对象方法







### 9、Pycharm操作Django技巧

#### 9.1 快速创建Django应用

![image-20211216001638808](django%E7%AC%94%E8%AE%B0.assets/image-20211216001638808.png)

#### 9.2 修改Django端口

![image-20211216001717991](django%E7%AC%94%E8%AE%B0.assets/image-20211216001717991.png)

![image-20211216001748598](django%E7%AC%94%E8%AE%B0.assets/image-20211216001748598.png)

## 三、ORM











































