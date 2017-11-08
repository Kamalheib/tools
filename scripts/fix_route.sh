#!/bin/sh

sudo route del -net 10.0.0.0 netmask 255.255.255.192 dev tun0
sudo route del -net 10.0.0.64 netmask 255.255.255.192 dev tun0
sudo route del -net 10.0.0.128 netmask 255.255.255.192 dev tun0
sudo route del -net 10.0.0.192 netmask 255.255.255.192 dev tun0
