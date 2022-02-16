## 一、mysql安装

### 1、Docker安装

> 推荐使用Docker安装
>
> [https://registry.hub.docker.com/_/mysql](https://registry.hub.docker.com/_/mysql)

```shell
Starting a MySQL instance is simple:

$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
... where some-mysql is the name you want to assign to your container, my-secret-pw is the password to be set for the MySQL root user and tag is the tag specifying the MySQL version you want. See the list above for relevant tags.
-------->
Connect to MySQL from the MySQL command line client
The following command starts another mysql container instance and runs the mysql command line client against your original mysql container, allowing you to execute SQL statements against your database instance:

$ docker run -it --network some-network --rm mysql mysql -hsome-mysql -uexample-user -p
... where some-mysql is the name of your original mysql container (connected to the some-network Docker network).

This image can also be used as a client for non-Docker or remote instances:

$ docker run -it --rm mysql mysql -hsome.mysql.host -usome-mysql-user -p
More information about the MySQL command line client can be found in the MySQL documentation

```

### 2、创建mysql容器

```shell
docker run  -dit -u root --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:latest
// MYSQL_ROOT_PASSWORD后面跟的是密码
```

### 3、外部机器链接

```shell
mycli -h127.0.0.1 -uroot -P 3307

// 这里端口是3307是因为机器上已经有一个mysql容器，并且端口3306已经被占用
```

![image-20220216162741325](mysql%E7%AC%94%E8%AE%B0.assets/image-20220216162741325.png)

