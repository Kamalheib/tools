#!/bin/sh

function usage() {
	echo "This script used to create a vlan interface."
	echo "-a|--action: Action to perform [create|delete]"
	echo "-i|--interface: Network interface to create the vlan over"
	echo "-d|--id: Vlan ID"
	echo "-p|--ip: Vlan IP address"
	echo "-h|--help: Display this message"
}


if [ $# -le 0 ]
then
	usage
	exit 1
fi

while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		-a|--action)
			ACTION=$2
			shift;;
		-i|--interface)
			IF_NAME=$2
			shift;;
		-d|--id)
			VLAN_ID=$2
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
	ip link add link $IF_NAME name $IF_NAME.$VLAN_ID type vlan id $VLAN_ID
	ip addr add dev $IF_NAME.$VLAN_ID $IP
	ip link set dev $IF_NAME.$VLAN_ID up
elif [ $ACTION == "delete" ]; then
	ip link delete $IF_NAME.$VLAN_ID
fi
