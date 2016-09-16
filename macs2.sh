#!/bin/bash
# generate yml to ansible and then exec ansible
MACS_LIST=macs.list
CMDS=gen.yml

PORTS="Fa0/11 Fa0/19"
ACLNAME=wifi`date +%s`

 echo '---' > $CMDS
 echo WIFI_PORTS: >> $CMDS
 for port in $PORTS; do
    echo " - $port" >> $CMDS
 done
 echo ACL_NAME: $ACLNAME >> $CMDS
 echo acl_lines: >> $CMDS
 
 for mac in `cat $MACS_LIST|awk -F':' '{print $1$2"."$3$4"."$5$6}'`; do
    echo " - permit host $mac any" >> $CMDS
 done
 ansible-playbook -i hosts macs.yml --extra-vars "acl_list=$CMDS"
