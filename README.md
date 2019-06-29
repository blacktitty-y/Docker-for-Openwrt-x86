Docker for Openwrt x86 完美运行~稳定性待测试
====


#### 本人小白一名, 自己亲身体验到求学路的艰难, 所以特意写了此教程给需要的朋友, 已经尽量写的很简短详细啦. 最终实现借鉴于, https://blog.csdn.net/wang805447391/article/details/83305276, https://gitlab.com/mcbridematt/openwrt-container-feed, 再此感谢作者小学生414, ope087,Mu Yu几个大佬们的帮助. 当然最后更要感谢Lean大雕的Openwrt源码啦~



### PS:首先是最重要的内核依赖, 需要添加进去. 将下面代码添加到配置好的.config文件最后面, 然后执行make menuconfig命令进入再直接退出保存就可以开始编译啦.
    CONFIG_KERNEL_BLK_CGROUP=y
    CONFIG_KERNEL_CGROUPS=y
    CONFIG_KERNEL_CGROUP_CPUACCT=y
    CONFIG_KERNEL_CGROUP_DEVICE=y
    CONFIG_KERNEL_CGROUP_FREEZER=y
    CONFIG_KERNEL_CGROUP_PERF=y
    CONFIG_KERNEL_CGROUP_PIDS=y
    CONFIG_KERNEL_CGROUP_SCHED=y
    CONFIG_KERNEL_CPUSETS=y
    CONFIG_KERNEL_DEBUG_BLK_CGROUP=y
    CONFIG_KERNEL_DEVPTS_MULTIPLE_INSTANCES=y
    CONFIG_KERNEL_FANOTIFY=y
    CONFIG_KERNEL_FHANDLE=y
    CONFIG_KERNEL_FREEZER=y
    CONFIG_KERNEL_IPC_NS=y
    CONFIG_KERNEL_LXC_MISC=y
    CONFIG_KERNEL_MEMCG=y
    CONFIG_KERNEL_MEMCG_KMEM=y
    CONFIG_KERNEL_MEMCG_SWAP=y
    CONFIG_KERNEL_MEMCG_SWAP_ENABLED=y
    CONFIG_KERNEL_MM_OWNER=y
    CONFIG_KERNEL_NAMESPACES=y
    CONFIG_KERNEL_NETPRIO_CGROUP=y
    CONFIG_KERNEL_NET_CLS_CGROUP=y
    CONFIG_KERNEL_NET_NS=y
    CONFIG_KERNEL_PERF_EVENTS=y
    CONFIG_KERNEL_PID_NS=y
    CONFIG_KERNEL_POSIX_MQUEUE=y
    CONFIG_KERNEL_PROC_PID_CPUSET=y
    CONFIG_KERNEL_RESOURCE_COUNTERS=y
    CONFIG_KERNEL_USER_NS=y
    CONFIG_KERNEL_UTS_NS=y
    CONFIG_PACKAGE_iptables-mod-extra=y
    CONFIG_PACKAGE_kmod-ipt-extra=y
    CONFIG_PACKAGE_kmod-veth=y
    
    CONFIG_PACKAGE_libdevmapper=y
    CONFIG_PACKAGE_libltdl=y





### 安装步骤 (根据步骤, 一行一行指令跟着敲)

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

6. 修改启动项为自己的挂载点

		vi /etc/init.d/docker


#### 进入编辑: 将里面的sdb1修改为自己的挂载点. 
#### 基本操作: 按i才可编辑, 编辑完以后esc, 输入 wq 保存退出. 输入 q 不保存直接退出.


7. 修改文件权限并运行Docker

		chmod +x docker
		./docker start


#### 到此结束, Docker安装完毕并且开始运行啦. 以上两个下载文件daemon.json和docker可自行创建, 内容在github上.



### 以下是我自己随手写的半自动脚本, 也是为了方便自己部署, 高端的也写不来. 自己凑合着用的. 还是上面自己一步一步来稳妥. 出问题了也好知道是哪里出错.

### 实在嫌上面麻烦的, 以下是我自己随手写的半自动脚本, 也是为了方便自己部署, 高端的也写不来. 自己凑合着用的. 还是上面自己一步一步来稳妥. 出问题了也好知道是哪里出错.实在嫌上面麻烦的就根据脚本内, 把挂载点修改成自己的就可以啦. 望有会写脚本的大神指点下~

###### 一键安装脚本:
	wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/install.sh && bash install.sh && rm -rf install.sh

###### 一键升级脚本:

	wget https://raw.githubusercontent.com/blacktitty-y/Docker-for-Openwrt-x86/master/update.sh && bash update.sh && rm -rf update.sh

### 目前方法方式都不太完善, 但是已经属于一个完整的方案了, 后面会持续更新...

### 后续应该会追加相应的升级, 卸载脚本. 并且可能也会有直接ipk安装的方式.
