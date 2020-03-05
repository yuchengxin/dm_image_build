# 达梦数据库镜像构建

标签（空格分隔）： 达梦 DM

---

达梦数据库开发版可以试用一年，试用期限从编译时开始算起，编译时间可从下载的安装文件名中获得，比如

#### dm8_setup_rh7_64_ent_8.1.1.45_20191121.iso

即编译时间为2019年11月21日，过期时间为2020年11月20日

如果过期了需要重新build镜像，步骤如下：

1、clone本项目
2、官网下载新的达梦数据库安装包，解压得到DMInstall.bin文件，将该文件放入到项目目录中和install.sh脚本同级，修改DMInstall.bin权限为777
3、执行以下命令build新的镜像
```shell
docker build -f dockerfile -t <image name>:<image tag> ./
```
注：image tag建议以 [版本]-[编译时间] 的方式创建，比如：8-20191121



