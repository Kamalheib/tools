#!/bin/sh

dnf install -y bison openssl-devel ncurses-devel bc elfutils-libelf-devel flex

mkdir -p /tmp/work/rootfs
cd /tmp/work/rootfs
dnf groupinstall "Minimal Install" --releasever=29 --installroot=`pwd` --repo=fedora --repo=updates -y
dnf install -y --releasever=29 --installroot=`pwd` --repo=fedora --repo=updates rdma-core pciutils infiniband-diags libibverbs-utils
sed -i 's/root:\*:/root::/g' etc/shadow

cd /tmp/work
git clone https://github.com/torvalds/linux.git
cd linux/
git checkout -b v4.19 v4.19
cp /boot/config-`uname -r` .
make olddefconfig
make -j 32
make -j 32 modules_install INSTALL_MOD_PATH=/tmp/work/rootfs
cd /tmp/work/rootfs
find . | cpio -o --format=newc > ../rootfs.img
