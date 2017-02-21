#!/bin/bash
cat ./dhcp.log  | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | awk '!a[$0]++' >> /tmp/runningtotal.txt
cat /tmp/runningtotal.txt | awk '!a[$0]++' | wc -l
