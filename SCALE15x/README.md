##Default/upgrade openwrt
1. Set laptop with a static IP of 192.168.1.2/24
2. Start up a continuous ping to 192.168.1.1
3. With the power off press and hold the reset button on the underside of router
4. Keep hold reset button until pings look something like the below(this is on ubuntu 16.04 other OS may look alittle diffrent)
Warning: time of day goes back (-3646444085811578108us), taking countermeasures.
40 bytes from 192.168.1.1: icmp_seq=105 ttl=64
5. Release the reset button after you see the above pings
6. Run "atftp --option "mode octet" --option "timeout  60" --verbose --trace -p -l openwrt-15.05.1-ar71xx-generic-wndr3800ch-squashfs-factory.img 192.168.1.1" to upload the firmware. As soon as the tftp transfer stops pings will stop too.
7. The router will reboot and ask the network for a dhcp address. From here the router is ready to receive it's config.

##Defaut hp switch
###Hard Reset
1. Using pointed objects, simultaneously press both the Reset and Clear buttons on the front of the switch. The power and fault lights come on.
2. Continue to press the Clear button while releasing the Reset button.
3. When the Self Test LED begins to blink, release the Clear button.
4. The switch will then complete its self test and begin operating with its configuration restored to the factory default setting

###With cli access
1. erase startup-config

##Upgrade firmware hp switch
1. copy tftp flash 10.1.0.3 <file name> primary
filename options
model=filename

##To config APs
1. Make sure that you have sqlite(apt-get install sqlite3 libsqlite3-dev)
2. Download  APs.csv,  ap.sh, applyapconfig.sh and installzabbix.sh
3. Make any needed changes to the APs.csv
4. Run ap.sh. In the configap folder you will find a folder for each hostname found in the APs.csv. Inside of the hostname folder you will find the config files for opwnwrt. 
5. Run applyapconfig.sh this will scp the config files to every AP found in the APs.csv, then apply the config change. If the config file that is uploaded is the same as already there then when the apply is done there will be no changes. If the config file is diffrent then the whole file will be overwrote with the new config file. During the apply if the running config has a setting that the config file does not then the running config will be changed to match the config file.
6. Run installzabbix.sh to install zabbix agent on all online openwrt APs. If device already has zabbix install then opkg will not reinstall zabbix agent. This script file will also copy the agent config file from the local copy to each device, overwriting any changes made to openwrt device.
7. The ap.sh will also make the lines that are needed for support the openwrts for the dns and dhcp config files. The new lines for the config files will need to be copied by hand and placed into the dns/dhcp server.

##To config switches
1. Make sure that you have sqlite(apt-get install sqlite3 libsqlite3-dev)
2. Download ports.csv, switches.csv, and  makeswconf.sh(you will need to get this file from the private repo)
3. Make any changes to needed to ports.csv, switches.csv and vendor-vlan-mapping.csv. Ports.csv has all of the ports for each switch and what vlan the port should be on. The switches.csv has the hostname and ip of each switch. The vendor-vlan-mapping.csv has the vendor name, booth numbers, and vlan. The vlan you must start at vlan 100 and work your way up.
4. Run ap.sh. In the configsw folder you will find a text file with the commands needed for each switch.
5. Connect to each switch and copy and paste the command to the switch and watch for errors. This can be done using ssh or console cable.
6. 7. The ap.sh will also make the lines that are needed for support the switches for the dns and dhcp config files. The new lines for the config files will need to be copied by hand and placed into the dns/dhcp server.

##known limitations and problems
1. At this time there is nothing in the switch config code that will remove settings already set on the switch. Example say that you config port 20 for vlan 60 and desc of AP1. Then you decided that AP1 needs to move to port 21. The code will make the new config for port 21 but will not remove anything from 20. You will have to remove by hand.
