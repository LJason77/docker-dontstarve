# 饥荒服务器

饥荒联机服务器的 docker 镜像。

## 安装

```bash
git clone https://github.com/LJason77/docker-dontstarve.git && cd docker-dontstarve
docker build -t dontstarve .
```

## 更新服务器

```bash
docker run --rm -it -v ~/Data/DoNotStarveTogether:/Steam/DoNotStarveTogether -v ~/Data/Steam:/Steam/Steam --entrypoint '' dontstarve bash
server_path=/Steam/DoNotStarveTogether/dontstarve ; backup_time=$(date +%s) ; mkdir -pv /tmp/$backup_time ; cd /Steam/Steam/
cp $server_path/mods/dedicated_server_mods_setup.lua /tmp/$backup_time/dedicated_server_mods_setup.lua
./steamcmd.sh +force_install_dir $server_path +login anonymous +app_update 343050 validate +quit
cp /tmp/$backup_time/dedicated_server_mods_setup.lua $server_path/mods/dedicated_server_mods_setup.lua && exit
```

## 运行

```bash
# 主世界
docker run -d --restart always --name dontstarve-Master -v ~/Data/DoNotStarveTogether:/Steam/DoNotStarveTogether dontstarve -cluster MyDediServer -shard Master
# 洞穴(如果需要)
docker run -d --restart always --name dontstarve-Caves -v ~/Data/DoNotStarveTogether:/Steam/DoNotStarveTogether dontstarve -cluster MyDediServer -shard Caves
```
