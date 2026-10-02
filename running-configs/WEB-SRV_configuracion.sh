#!/bin/sh
ip addr flush dev eth0
ip route flush dev eth0
ip link set eth0 up
ip addr add 10.15.71.130/28 dev eth0
ip route add default via 10.15.71.129
nginx -t
nginx
netstat -lnt | grep 443
