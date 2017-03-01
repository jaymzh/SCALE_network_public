#!/bin/bash
cd ./configap

if [ $# -eq 0 ]; then
  var=`ls -d */`
else
  var=$1
fi

for i in $var
do
#echo ${i%%/}
scp -i ../id_rsa -r ./"${i%%/}"/* root@"${i%%/}":/etc/config/
ssh -i ../id_rsa root@"${i%%/}" "uci commit"
done
