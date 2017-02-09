#!/bin/bash
cd ./configap
for i in $(ls -d */)
do 
#echo ${i%%/} 
scp -i ../id_rsa -r ./"${i%%/}"/* root@"${i%%/}":/etc/config/
ssh -i ../id_rsa root@"${i%%/}" "uci commit"
done
