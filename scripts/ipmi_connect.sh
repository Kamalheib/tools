#!/bin/sh

HOST=$1
USER=$2
PASS=$3

ipmitool -I lanplus -H $HOST -U $USER -P $PASS -a sol activate
