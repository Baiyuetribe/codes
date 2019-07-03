## KodExplorer文件管理

## 适用于容器管理、开发及私有云搭建

### RUN

```
docker run -d -p 889:80 --name kodexplorer -v "$PWD":/code baiyuetribe/kodexplorer
```

然后打开浏览器，访问http://ip:889 就可以进入了。如需替换端口，请修改`889`端口值就行。

> "$PWD" :指当面运行目录
>
> -v：挂载文件目录



## 跟新记录

### [ver4.40 `2019/3/21`](https://doc.kodcloud.com/#/others-changelog?id=ver440-2019321)

------

#### [update:](https://doc.kodcloud.com/#/others-changelog?id=update)

- 文件列表中文排序优化；中文、数字等组合按自然排序进行排列；
- 水印插件优化：分享文档水印显示分享者信息
- 自定义桌面目录，可以指定桌面文件夹名称
- 离线下载，http header兼容不标准的头处理。中文文件名自动识别优化。
- 控制器自动路由，Hook加入重定向文件；方便插件整体替换某个控制器文件；

#### [fix bug](https://doc.kodcloud.com/#/others-changelog?id=fix-bug)

- 禁用预览权限，部分预览插件依然能预览问题处理；优化无权限时前端提示
- 在部门中没有列目录权限时，打开首页报错优化处理【不显示内容，点击切换该目录时提示权限】
- 用户管理部门文档权限时：不允许内部拖拽到外部；
- 分享文件夹，部分类型文件打开预览是报错处理

### [ver4.39 `2019/3/1`](https://doc.kodcloud.com/#/others-changelog?id=ver439-201931)

------

#### [update:](https://doc.kodcloud.com/#/others-changelog?id=update-1)

- 桌面打开文件夹对话框，不同窗口文件相互剪切粘贴，自动同步窗口文件列表状态。
- 解压到选择文件夹时；自动判断当前文件夹是否可写入；不可写则不可选择当前文件夹
- 验证码固定为4位

#### [fix bug](https://doc.kodcloud.com/#/others-changelog?id=fix-bug-1)

- 解决APP中文本文件预览问题
- 桌面压缩文件解压功能异常问题修复；
- 桌面文件夹中含有#*&字符的文件夹，打开路径错误问题修复；

### [ver4.38 `2019/2/25`](https://doc.kodcloud.com/#/others-changelog?id=ver438-2019225)

------

#### [update:](https://doc.kodcloud.com/#/others-changelog?id=update-2)

- 排序优化：文件夹列表，中文排序支持按拼音进行排序
- 针对移动端APP进行兼容适配优化
- 部门列表过多时，排序效率优化。
- 新增hook点
- 其他细节优化

#### [fix bug](https://doc.kodcloud.com/#/others-changelog?id=fix-bug-2)

- https请求优化兼容
- cad分享无法预览问题解决
