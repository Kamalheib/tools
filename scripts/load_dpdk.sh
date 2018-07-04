#!/bin/sh

dpdk-devbind -u  0000:00:03.0
dpdk-devbind -u  0000:00:04.0
mount -t hugetlbfs nodev /mnt/huge
modprobe vfio-pci
echo 1 > /sys/module/vfio/parameters/enable_unsafe_noiommu_mode
dpdk-devbind --bind=vfio-pci  0000:00:03.0  0000:00:04.0

#cd /home/kheib/git/ethernity/dpdk
#./examples/ethtool/ethtool-app/build/ethtool  -l 1-2 --vfio-intr=legacy

cd /home/kheib/git/ethernity/dpdk/examples/l2fwd/build
./l2fwd -c 0x3 -n 2 -- -p 0x3
