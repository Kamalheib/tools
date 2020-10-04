#!/bin/sh

#RDMA core
yum install -y cmake gcc libnl3-devel libudev-devel pkgconfig valgrind-devel ninja-build python3-devel python3-Cython python3-docutils pandoc

#iproute2
yum install -y bison flex libmnl-devel libcap-devel

#kernel
yum install -y openssl openssl-devel elfutils-libelf-devel bc
