#!/bin/sh

ACTION=$1
IF_NAME=$2
VLAN_ID=$3
IP=$4

if [ $1 == "create" ]; then
	ip link add link $IF_NAME name $IF_NAME.$VLAN_ID type vlan id $VLAN_ID
	ip addr add dev $IF_NAME.$VLAN_ID $IP
	ip link set dev $IF_NAME.$VLAN_ID up
elif [ $1 == "delete" ]; then
	ip link delete $IF_NAME.$VLAN_ID
fi
