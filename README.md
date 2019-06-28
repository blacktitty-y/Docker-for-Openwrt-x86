# 本人小白一名, 自己亲身体验到求学路的艰难, 所以特意写了此教程给需要的朋友. 最终实现借鉴于https://blog.csdn.net/wang805447391/article/details/83305276, 再此感谢作者小学生414, 还有ope087两位大佬的帮助. 

# 安装步骤 (根据步骤, 一行一行指令跟着敲)
1. 进入安装Docker目录（PS:根据自己位置更改下面出现的sdb1）

cd /mnt/sdb1

2. 下载Docker并解压 (PS:此处可以自行修改最新版本下载)

wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.7.tgz

tar -xzvf docker-18.09.7.tgz

3. 将执行文件链接到/usr/sbin

ln -s /mnt/sdb1/docker/* /usr/sbin

4. 创建Docker相关目录与文件

cd docker

mkdir data config

cd config

wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/daemon.json

5. 创建启动项

cd /etc/init.d

wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/docker

6. 修改启动项为自己的挂载点 (也就是第一步的安装目录)

vi /etc/init.d/docker

进入编辑: 将里面的sdb1修改为自己的挂载点. 
基本操作: 按i才可编辑, 编辑完以后esc, 输入 wq 保存退出. 输入 q 不保存直接退出.

7. 修改文件权限并运行Docker

chmod +x docker

./docker start

# 到此结束, Docker安装完毕并且开始运行啦.



# 以下是我自己随手写的半自动脚本, 也是为了方便自己部署, 高端的也写不来. 自己凑合着用的. 
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/install.sh && bash install.sh && rm -rf install.sh
