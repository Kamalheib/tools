#!/bin/sh

HOST=$1
PASS=$2

ipmitool -I lanplus -H $HOST -U root -P $PASS -a sol activate
