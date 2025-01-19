#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70

while read -r line
do
    USAGE=$(echo $line | awk -f " " '{print $6F}' | cut -d "%" -f1)   
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    echo "Partition: $PARTITION , Usage: $USAGE"

done <<< $DISK_USAGE