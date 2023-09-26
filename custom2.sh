#!/bin/bash
#
# Copyright (c) 2023 miyunda https://miyundacom>
# OpenWrt custom script part 2/2 (Once feeds updated)
#

c_g=package/base-files/files/bin/config_generate
# Set max concurrent conns
sed -i '$a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# Set timezone to China
sed -i 's/UTC/CST-8/' $c_g

# Set timezone name
sed -i "/'CST-8'/a\\\t\tset system.@system[-1].zonename='Asia\/Shanghai'" $c_g

# Set NTP upstream servers and enable NTP serivce
sed -i "s/ntp.enable_server='0'/ntp.enable_server='1'/" $c_g
sed -i 's/0.openwrt.pool.ntp.org/cn.ntp.org.cn/' $c_g
sed -i 's/1.openwrt.pool.ntp.org/ntp1.aliyun.com/' $c_g
sed -i 's/2.openwrt.pool.ntp.org/ntp.tencent.com/' $c_g

# Modify default IP, eg 192.168.100.1
#sed -i 's/192.168.1.1/192.168.100.1/g' $c_g