#!/bin/sh

USER=$1

sudo openconnect --servercert=sha256:cd8bc44a2b2d6d05eecceb80f0ffd43e5d569245a451a6c19e5e47a9d486b687 --protocol=nc ssl-il.mellanox.com --pid-file="/var/run/work-vpn.pid" --user=$USER  --authgroup="Mellanox_VIP_Access_App/Token_Auth"
