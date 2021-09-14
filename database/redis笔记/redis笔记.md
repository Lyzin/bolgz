前言：使用Docker 来搭建Redis环境

镜像官网：https://hub.docker.com/_/redis

------

## 一、搭建Redis环境

### 1. 创建redis容器

1.1 使用redis-cli客户端连接方式创建redis容器

```bash	
 docker run -idt --name redisly -p 6379:6379 redis
 
 # 命令参数解释
 -idt: i表示可以进行交互，t表示开启一个tty终端，d表示在后台运行容器
 --name: 表示自定义容器名，进入容器时可以使用该名字进入
 --rm: 表示创建redis容器时候，如果存在redis 、redis-cli先删除再创建
 -p: 表示将容器内端口映射到宿主机的端口
```

 1.2 创建redis容器，无密码

![image-20210608132942146](redis%E7%AC%94%E8%AE%B0.assets/image-20210608132942146.png)

### 2. 连接测试

2.1 宿主机连接redis

![image-20210608133051787](redis%E7%AC%94%E8%AE%B0.assets/image-20210608133051787.png)

2.2 登录创建的redis容器连接查看redis

> enter命令是自定义编写的快速进入docker容器的脚本命令
>
> name这个键值对是测试数据

![image-20210608133203186](redis%E7%AC%94%E8%AE%B0.assets/image-20210608133203186.png)

2.3 python代码测试redis容器

```python
import redis

conn_dict = {
    'host':'127.0.0.1',
    'port': 6379
}

r = redis.Redis(**conn_dict)

# 获取所有数据，返回值是一个List，每个元素都是bytes类型
all_data = r.keys('*')

# 结果是: [b'name']
print(all_data) 

# get方法是返回结果是bytes类型数据，需要解码
data = r.get('name').decode('utf-8')

# 结果是: alex
print(data)
```

## 二、Redis教程

1、