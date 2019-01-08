#!/bin/sh

dnf install -y libtool rpcgen gnutls-devel libnl3-devel glibc2 glibc-devel mingw32-portablexdr mingw64-portablexdr
cd /home
git clone http://github.com/kamalheib/libvirt
cd libvirt
dnf install -y `cat libvirt.spec.in | grep "BuildRequires" | cut -d " " -f 2 | grep -v python`
./autogen.sh --prefix=$HOME/usr
make -j 16
make -j install
