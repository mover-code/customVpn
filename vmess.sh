#!/bin/bash

filePath='/data/shell'
fileName='/data/shell/vmess'

init(){
    # busyboxUrl='https://zgao.top/download/busybox-x86_64'

    # publicIp=$(curl -s ifconfig.me)
    # port='3306'

    # cd $filePath

    # curl $busyboxUrl -o busybox -s

    # chmod +x busybox

    # /var/tmp/busybox httpd -p 0.0.0.0:$port -h $filePath

    random

    # echo "30 * * * * $filePath/vmess.sh random " >/var/spool/cron/root
    # crontab -u root /var/spool/cron/root

    # echo "[+]定时任务添加成功，每小时更新一次trojan端口"

    # echo "[+]你的trojan伪动态订阅链接为：http://$publicIp:$port/vmess"

}

random(){
    # 随机生成40000~50000之间的一个随机数
    randPort=$((RANDOM % 1000 + 30000 ))   
    echo -e \
    "trojan://77fd0e60@proxy.chydao.org:443#freedom"\
    | sed "s/443/$randPort/g" | base64 -w 0 | sed "s/o=/==/g" > $fileName
    echo "$randPort vmess"
}


if [ "$1" == "random" ]; then
    random
else
    init
fi



