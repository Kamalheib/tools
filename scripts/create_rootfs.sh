#!/bin/sh

dnf install -y bison openssl-devel ncurses-devel bc elfutils-libelf-devel flex

mkdir -p /home/rootfs
cd /home/rootfs
dnf groupinstall "Minimal Install" --releasever=30 --installroot=`pwd` --repo=fedora --repo=updates -y
dnf install -y --releasever=30 --installroot=`pwd` --repo=fedora --repo=updates rdma-core pciutils infiniband-diags libibverbs-utils
sed -i 's/root:\*:/root::/g' etc/shadow

cd /tmp
git clone https://github.com/torvalds/linux.git
cd linux/
git checkout -b v4.19 v4.19
wget https://raw.githubusercontent.com/Kamalheib/configs/master/linux/config
mv config .config
make olddefconfig
make -j 32
make -j 32 modules_install INSTALL_MOD_PATH=/home/rootfs
cd /home/rootfs
find . | cpio -o --format=newc > ../rootfs.img
