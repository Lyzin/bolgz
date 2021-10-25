## 一、Django框架

### 1、web框架的底层理解

> 从手动创建一个web框架开始

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

#### 1.2 

### 2、Django安装

> Django的版本问题
>
> - Django1.x和Django2.x的差距不大
> - 所以先学习Django1.x的即可，后续有需要可以往Django2.x过渡

```bash
pip install django==1.11.11
```



## 二、Django基本操作

> 下面基本都在命令行操作

### 1、创建项目

> blog是项目名

```bash
django-admin startproject blog
```

![image-20210902132231889](django%E7%AC%94%E8%AE%B0.assets/image-20210902132231889.png)

> 可以看到项目目录的结构
>
> 根目录：`manage.py`   `myblog`
>
> `myblog`目录中：
>
> - `setting.py`
> - `urls.py`
> - `wsgi.py`

### 2、创建应用

> - 一个app就是一个功能独立的模块
>
> - 一个项目可以有多个app
>
> - home是应用名
>
> 由于django 1.11版本和python3.7版本不兼容, 2.0版本以后的Django修复了这个问题
>
> 所以使用下面命令创建app就需要注意下python3和Django的版本

```bash
# 切换到创建的项目根目录
python3 manage.py startapp home
```

#### 2.1 目录结构

![image-20210902134207078](django%E7%AC%94%E8%AE%B0.assets/image-20210902134207078.png)

### 3、项目目录结构介绍

```bash
- myblog目录
		- myblog目录中：
			 -- setting.py 配置文件
			 -- urls.py  路由与视图函数对应关系（路由层）
			 -- wsgi.py  wsgiref模块（不考虑）
		- manage.py  项目入口文件
		- db.sqlite3 自带数据库，很小，仅仅用来做测试
		- app01目录
			 -- admin.py 后台管理
			 -- apps.py 注册使用
			 -- migrations 数据库迁移日志文件
			 -- models.py 数据库模型类，用于ORM
			 -- views.py 视图函数文件
			 -- test.py 测试文件
```

### 4、启动项目

```bash
python manage.py runserver
```

![image-20210902135206787](django%E7%AC%94%E8%AE%B0.assets/image-20210902135206787.png)

### 5、创建`templates`

> 命令行创建没有`templates`文件目录
>
> pycharm创建是有的



### 6、Django三件套

#### 1. HttpResponse

> 返回字符串格式的响应文件

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

#### 2. render

> 返回渲染的文件，将`html`文件变成字节形式返回

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

> 表示在视图函数中跳转到别的页面

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





## 三、ORM初探











































