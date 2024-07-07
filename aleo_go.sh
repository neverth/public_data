#!/bin/bash

# 检查是否以root用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以root用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到root用户，然后再次运行此脚本。"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "❌ 参数1没有指定"
    exit 1
fi

sudo apt-get update

sudo apt-get install unzip

# 启动代理
wget -O mihomo-linux-amd64-v1.18.6.gz https://github.com/MetaCubeX/mihomo/releases/download/v1.18.6/mihomo-linux-amd64-v1.18.6.gz

gzip -f -d mihomo-linux-amd64-v1.18.6.gz

chmod +x mihomo-linux-amd64-v1.18.6

wget -O mihomn_config.yaml https://raw.githubusercontent.com/neverth/public_data/main/mihomn_config.yaml

mkdir /etc/mihomo -p

cp mihomn_config.yaml /etc/mihomo/config.yaml

nohup ./mihomo-linux-amd64-v1.18.6 -d /etc/mihomo >> ./mihomo.log 2>&1 &

sleep 10

pkill mihomo

nohup ./mihomo-linux-amd64-v1.18.6 -d /etc/mihomo >> ./mihomo.log 2>&1 &

curl baidu.com

curl google.com

# wakuang
wget -O Aleo+miner+2.7.6.zip https://public-download-ase1.s3.ap-southeast-1.amazonaws.com/aleo-miner/Aleo+miner+2.7.6.zip

unzip -o Aleo+miner+2.7.6.zip

chmod +x aleo.sh && chmod +x aleo-miner

wget -O aleo_autorun.sh https://raw.githubusercontent.com/neverth/public_data/main/aleo_autorun.sh

chmod +x aleo_autorun.sh

nohup ./aleo_autorun.sh $1 >> ./aleo_autorun.log 2>&1 &
