#!/bin/sh

yum install -y pixman-devel jemalloc-devel libcap-devel libattr-devel glib2-devel zlib-devel
mkdir -p /home/
cd /home
git clone https://github.com/qemu/qemu.git
cd qemu
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
         --libexecdir=/usr/lib/qemu --python=/usr/bin/python2 \
         --smbd=/usr/bin/smbd --enable-modules \
         --enable-jemalloc --enable-debug --target-list=x86_64-softmmu --enable-virtfs --enable-rdma
CFLAGS+="-DPVRDMA_DEBUG" make -j 16
