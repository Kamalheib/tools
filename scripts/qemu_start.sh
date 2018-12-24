#!/bin/sh

KERNEL=/tmp/work/linux/arch/x86/boot/bzImage
ROOTFS=/tmp/work/rootfs.img

cd ~/work/qemu/
./build/x86_64-softmmu/qemu-system-x86_64 \
	-s \
	-cpu host \
	-smp cpus=4 \
	-m 2G \
	-nographic \
	-enable-kvm  \
	-kernel $KERNEL \
	-initrd $ROOTFS \
	-append "root=/dev/ram rdinit=/sbin/init  console=ttyS0 nokaslr" \
	-object memory-backend-ram,id=mb1,size=1G,share \
