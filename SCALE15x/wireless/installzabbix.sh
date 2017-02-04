#!/bin/bash
cd ./configap
for i in $(ls -d */)
do 
#echo ${i%%/} 
ssh root@"${i%%/}" "opkg update && opkg install zabbix-agentd zabbix-extra-mac80211 zabbix-extra-network zabbix-extra-wifi "

done
