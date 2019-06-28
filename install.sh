cd /mnt/sdb1
wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.7.tgz
tar -xzvf docker-18.09.7.tgz
cd docker
mkdir bin
mv * bin
mkdir data config
cd config
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/daemon.json
ln -s /mnt/sdb1/docker/bin/* /usr/sbin
cd /etc/init.d
wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/docker
chmod +x docker
./docker start
