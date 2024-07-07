pkill aleo-miner

echo "Start"

command="nohup ./aleo-miner -d 0 -u stratum+tcp://aleo-asia.f2pool.com:4400 -w $1 >> ./aleo-miner.log 2>&1 &"

# 设置执行命令的间隔时间(单位:秒)
interval=7200 # 2小时

while true; do
    # 执行命令
    eval "$command"

    # 等待一小时
    sleep $interval

    # 杀死之前的进程
    pkill aleo-miner

    echo "Command has been restarted."
done
