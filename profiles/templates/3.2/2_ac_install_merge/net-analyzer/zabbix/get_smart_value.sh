# Calculate path=/etc/zabbix/script chown=zabbix:zabbix chmod=500

#!/bin/bash
if [ $# -ne 2 ];
then
echo "Usage: $0 <device> <parameter>"
exit
fi
 
 smartctl -A $1 | grep $2 | tr -s ' ' | sed "s/^[[:space:]]*\(.*\)[[:space:]]*$/\1/" | cut -d " " -f 10