# custom VPN
私人定制VPN


## Description (介绍)
VPN  Virtunal Private Network 

帮助访问受限制的内容

付费VPN价格一般很贵，免费的节点稳定性和网速又不好，此教程适合动手实践能力强的小伙伴

协议trojan，Trojan通过将通信流量伪装成常见的HTTPS流量，来防止流量被检测和干扰。

动态端口,在使用过程可能会遭受TCP阻断，计划任务每隔一段时间修改端口


## Condition (准备条件)
虽然是白嫖教程，但还是需要一定条件的
开始之前需要满足以下条件

1. 域名
2. 信用卡(可以扣除美元)
3. VPS Virtunal Private Server

以上都满足的小伙伴直接跳过到下面部署教程

域名购买途径

- [USDT直购](https://my.nextcli.com/)  一年10USDT 以内，到cloudfare 解析域名,此网站vps 60USDT 每月成本太高
- aws 直购 大概几美元一年可以在aws直接解析

信用卡途径

- 币安支付服务，可以直接购买到一次性信用卡
- [万里汇](https://portal.worldfirst.com.cn/login) 可以开100张卡,充值激活10U 使用paypal 转账充值(需要的伙伴可以找我)有手续费损耗,需要一个大陆paypal 一个非大陆paypal 大陆绑定银行卡向非大陆付款，非大陆绑定万里汇收款银行提现到银行卡

还有其他方式(我觉得成本较高)

VPS

- AWS 一年免费试用
- Azure 200U 体验金
- 阿里巴巴国际站,需要一个接收短信的手机号

## Deploy(部署)

1. 创建一个/data 文件夹
2. 安装宝塔客户端,安全组打开30000-50000,80,443,宝塔端口,22,3306 [下载链接](https://www.bt.cn/new/download.html)
3. 进入data文件夹克隆本项目
4. 修改文件名称为shell
5. 安装trojan,运行trojan_install.sh 过程中域名绑定为解析的域名
6. 修改clash_config.yaml 配置文件中你的域名和安装后的密码,修改vmess.sh中的密码和域名
7. 在宝塔面板添加计划任务,/data/shell/trojan_sub.sh  /data/shell/vmess.sh  间隔时间修改端口
8. nohup /data/shell/server.sh 打开订阅更新服务
9. iptables -t nat -A PREROUTING -p tcp --dport 30000:50000 -j REDIRECT --to-ports 443  端口数据转发
10. 订阅链接为 http://ip:3306/(sub/vmess) sub适用与clash 客户端 vmess 适用于OneClick

## client(客户端) 

我这里整理clash Mac/Windows/Android 客户端下载 [链接](https://cloud.189.cn/web/share?code=zu6niyAvauUz)
ios 需要非大陆appid在appStore 下载 oneclick android 也可在google play 下载

