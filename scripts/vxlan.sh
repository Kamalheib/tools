#!/bin/bash

function usage() {
	echo "This script used to create a vxlan interface"
	echo "-a|--action: Action to perform [create delete]"
	echo "-i|--interface: Network interface to create the vxlan over"
	echo "-d|--id: VxLAN ID"
	echo "-p|--ip: VxLAN IP address"
	echo "-h|--help: Display this message"
}

if [ $# -le 0 ]
then
	usage
	exit 1
fi

while [[ $# -gt 0 ]]
do
	key=$1
	case $key in
		-a|--action)
			ACTION=$2
			shift;;
		-i|--interface)
			IF_NAME=$2
			shift;;
		-d|--id)
			VXLAN_ID=$2
			shift;;
		-p|--ip)
			IP=$2
			shift;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			usage
			echo "Unknown parameter $1 $2"
			exit 1
			;;
	esac
	shift
done

if [ $ACTION == "create" ]; then
	ip link add vxlan$VXLAN_ID type vxlan id $VXLAN_ID group 239.0.0.1 dev $IF_NAME dstport 4789
	ip addr add dev vxlan$VXLAN_ID $IP
	ip link set dev vxlan$VXLAN_ID up
elif [ $ACTION == "delete" ]; then
	ip link delete vxlan$VXLAN_ID
fi
