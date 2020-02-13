# codes
本站优质代码汇总

## 本站一键脚本汇总

分类：

## 基础工具及环境：

```
bash <(curl -L -s https://raw.githubusercontent.com/Baiyuetribe/codes/master/docker.sh)   #智能安装Docker环境
```

### 影视播放及下载
[人人影视](https://github.com/Baiyuetribe/rrshare_docker)

### Linux可视化文件管理器


### RUN

```
docker run -d -p 889:80 --name kodexplorer -v "$PWD":/code baiyuetribe/kodexplorer
```

然后打开浏览器，访问http://ip:889 就可以进入了。如需替换端口，请修改`889`端口值就行。

> "$PWD" :指当面运行目录
>
> -v：