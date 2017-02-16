#!/bin/bash
cd ./configap
for i in $(ls -d */)
do 
#echo ${i%%/} 
ssh -i ../id_rsa root@"${i%%/}" "opkg update && opkg install zabbix-agentd zabbix-extra-mac80211 zabbix-extra-network zabbix-extra-wifi rpcd-mod-file libubus-lua"
scp -i ../id_rsa ../zabbix_agentd.conf root@"${i%%/}":/etc/zabbix_agentd.conf
ssh -i ../id_rsa root@"${i%%/}" "/etc/init.d/zabbix_agentd restart"
done
