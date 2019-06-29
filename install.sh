#进入安装Docker挂载点（可根据自己位置更改）
cd /mnt/sdb1

#下载Docker并解压 (此处可以自行修改最新版本下载)
wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.7.tgz
tar -xzvf docker-18.09.7.tgz
rm -rf docker-18.09.7.tgz

#将执行文件链接到/usr/sbin (路径也需要改成自己的挂载点)
cd docker
ln -s /mnt/sdb1/docker/* /usr/sbin

#创建Docker相关目录与文件
mkdir data config
cd config
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/daemon.json

#创建启动项并修改文件权限 (docker文件内三处挂载点需要修改成自己的)
cd /etc/init.d
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/docker

#运行Docker
chmod +x docker
./docker start

echo "Docker for Openwrt x86 安装成功！"
