#进入安装Docker挂载点（可根据自己位置更改）
./etc/init.d/docker stop

#下载Docker并解压 (此处可以自行修改最新版本下载)
cd /mnt/sdb1
wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.7.tgz
tar -xzvf docker-18.09.7.tgz
rm -rf docker-18.09.7.tgz

#运行Docker
./etc/init.d/docker start

echo "Docker for Openwrt x86 更新完成！"
