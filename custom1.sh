#!/bin/bash
#
# Copyright (c) 2023 miyunda https://miyundacom>
# OpenWrt custom script part 1 (Before Update feeds)

# Introduce kenzo's repositories
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default