#!/bin/sh

KERNEL=/tmp/work/linux/arch/x86/boot/bzImage
ROOTFS=/tmp/work/rootfs.img

cd ~/work/qemu/
./build/x86_64-softmmu/qemu-system-x86_64 \
	-s \
	-cpu host \
	-smp cpus=4 \
	-m 4G \
	-nographic \
	-enable-kvm  \
	-kernel $KERNEL \
	-initrd $ROOTFS \
	-append "root=/dev/ram rdinit=/sbin/init  console=ttyS0 nokaslr" \
	-object memory-backend-ram,id=mb1,size=2G,share \
	-chardev socket,path=/var/run/rdmacm-mux-mlx4_0-2,id=mads \
	-netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
	-device vmxnet3,addr=10.0,multifunction='on',netdev=net0 \
	-device pvrdma,addr=10.1,ibdev=mlx4_0,netdev=tap0,mad-chardev=mads \
