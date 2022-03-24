## 一、Mysql环境搭建

### 1、mysql镜像地址

> 推荐使用docker搭建mysql环境，非常方便用来学习mysql
>
> [mysql的docker镜像地址](https://registry.hub.docker.com/_/mysql)

### 2、创建mysql容器

#### 2.1 拉取mysql镜像

```bash
docker pull mysql
```

#### 2.2 创建mysql容器

> 下面内容来自dockerhub里mysql的使用介绍

```bash
#Configuration without a cnf file
#Many configuration options can be passed as flags to mysqld. This will give you the flexibility to customize the container without needing a cnf file. For example, if you want to change the default encoding and collation for all tables to use UTF-8 (utf8mb4) just run the following:

$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# If you would like to see a complete list of available options, just run:
$ docker run -it --rm mysql:tag --verbose --help

------------------->翻译如下<--------------------------
#没有cnf文件的配置
#许多配置选项可以作为标志传递给mysqld。这将使你能够灵活地定制容器而不需要cnf文件。例如，如果你想改变所有表的默认编码和排序为使用UTF-8(utf8mb4)，只需运行以下内容。
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# 如果你想看到可用选项的完整列表，只需运行。
$ docker run -it --rm mysql:tag --verbose --help
```

> 创建mysql容器

```bash
$ docker run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# --name mysql 创建的容器名叫mysql
# -e MYSQL_ROOT_PASSWORD=123456   MYSQL_ROOT_PASSWORD指定了将为MySQL根超级用户账户设置的密码，可以看到是123456
# --character-set-server=utf8mb4  设置mysql字符编码为utf8mb4，表示可以支持中文和表情
# --collation-server=utf8mb4_unicode_ci 在字符集内用于比较或排序字符的一套规则，即校验规则
```

![image-20220324152525798](go_mysql%E4%BD%BF%E7%94%A8.assets/image-20220324152525798.png)

#### 2.3 连接数据库

> 这里使用了`mycli`这个包来连接数据库测试
>
> `mycli`包时python写的一个具有代码提示的mysql使用工具

![image-20220324152502070](go_mysql%E4%BD%BF%E7%94%A8.assets/image-20220324152502070.png)

> 可以看到连接数据库成功，可以成功登录到mysql里面了

## 二、go使用mysql

### 1、go连接mysql