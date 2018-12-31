#!/bin/sh

cd /home
git clone http://github.com/kamalheib/libvirt
for p in `cat libvirt.spec.in | grep "BuildRequires" | cut -d " " -f 2`; do dnf install -y $p; done
cd libvirt
./autogen.sh
