<p align="center">
  <a href="https://nextcloud.com//">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Nextcloud_Logo.svg/1280px-Nextcloud_Logo.svg.png" alt="Bootstrap logo" width="72" height="72">
  </a>
</p>

<h1 align="center">Nextcloud</h1>

## 前言

NextCloud（[nextcloud.com](https://baiyue.one/部落跳转.html?url=http://nextcloud.com/)）是一款用于自建私有网盘的云存储开源软件，采用PHP+MySQL开发，功能类似百度云盘，提供了PC、IOS和Android三个同步客户端支持多种设备访问，用户可以很方便地与服务器上存储的文件、日程安排、通讯录、书签等重要数据保持同步，还支持其他同步来源：Amazon S3、Dropbox、FTP、Google Drive、OpenStack Object Storage、SMB、WebDAV、SFTP。

官网演示：[https://demo.nextcloud.com](https://baiyue.one/部落跳转.html?url=https://demo.nextcloud.com)

> 新增两种部署方法：快速部署适合体验，长期或正式环境使用，请选择B方案（正式环境部署）

## A:快速部署（仅用于体验，数据无保留）

**项目地址：**

### 1.Docker安装（已安装的可省略此步骤）

```
docker version > /dev/null || curl -fsSL get.docker.com | bash 
service docker restart 
systemctl enable docker  #设置开机自启
```

- [Docker新手入门学习笔记(含视频演示)](https://baiyue.one/archives/368.html)

### 2.部署

```
docker run -d -p 8080:80 nextcloud   #官方脚本
```

然后打开浏览器，访问[http://ip:8080](https://baiyue.one/部落跳转.html?url=http://ip:8080) 就可以进入了。如需替换端口，请修改8080为端口值就行。

![](https://baiyue.one/wp-content/uploads/2019/07/5de7d-007rd8E4ly1g1ec13ftkjj30jr0mcagf.jpg)



## B：正式环境部署（宿主机保留文件和数据库）

正式环境设置宿主机挂载目录和数据库挂载目录，因此重启或者其它操作下，所有数据本地均有记录。

### 1.Docker安装（已安装的可省略此步骤）

```
docker version > /dev/null || curl -fsSL get.docker.com | bash 
service docker restart 
systemctl enable docker  #设置开机自启
```

- [Docker新手入门学习笔记(含视频演示)](https://baiyue.one/archives/368.html)

### 2.Docker-compose环境安装（已安装的可省略此步骤）

```
curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose   #下载最新文件
chmod +x /usr/local/bin/docker-compose     #添加可执行权限
```

### 3.部署程序

```
mkdrir nextcloud && cd nextcloud	#临时创建nextcloud文件，用于存放启动文件
wget https://raw.githubusercontent.com/Baiyuetribe/codes/master/nextcloud/docker-compose.yml
docker-compose up -d
```

然后打开浏览器，访问[http://ip:8080](https://baiyue.one/部落跳转.html?url=http://ip:8080) 就可以进入了。数据库采用`mariadb`，默认数据库名和ROOT密码均为`nextcloud`

详细说明：

关于`docker-compose.yml`

```yaml
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    restart: always
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=nextcloud
      - MYSQL_DATABASE=nextcloud

  app:
    image: nextcloud
    ports:
      - 8080:80
    links:
      - db
    volumes:
      - nextcloud:/var/www/html
    restart: always
```

其中`db数据卷`用于存放数据库文件，容器重启或者删除操作下，数据库文件不丢失；同理，`nextcloud`数据卷也有同样的功能。

![](https://img.baiyue.one/upload/2019/07/5d364b599cc19.png)

## 视频安装演示地址：

请参考以下博客文章

文章来源：https://baiyue.one/archives/453.html

>
