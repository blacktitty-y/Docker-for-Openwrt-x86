#进入安装Docker挂载点（可根据自己位置更改）
cd /mnt/sdb1

#下载Docker并解压 (此处可以自行修改最新版本下载)
wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.7.tgz
tar -xzvf docker-18.09.7.tgz
rm -rf docker-18.09.7.tgz

#将执行文件链接到/usr/sbin
cd docker
mkdir bin
mv * bin
ln -s /mnt/sdb1/docker/bin/* /usr/sbin

#创建Docker相关目录与文件
mkdir data config
cd config
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/daemon.json

#创建启动项并修改文件权限
cd /etc/init.d
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/docker
chmod +x docker

#运行Docker
./docker start

clear

echo "Docker for Openwrt x86 安装成功！"
