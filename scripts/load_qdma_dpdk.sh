#!/bin/sh

mount -t hugetlbfs nodev /mnt/huge
modprobe -v uio
insmod /work/dpdk/build/kmod/igb_uio.ko
python /work/dpdk/tools/dpdk-devbind.py -b igb_uio 02:00.0
/work/dpdk/examples/qdma_testapp/build/app/qdma_testapp -c 0xf -n 4 --
