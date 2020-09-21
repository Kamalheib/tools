#!/bin/bash

dnf install -y cmake gcc libnl3-devel libudev-devel pkgconfig valgrind-devel ninja-build python3-devel python3-Cython python3-docutils pandoc
cd /home
git clone https://github.com/kamalheib/rdma-core
cd /home/rdma-core
bash build.sh
