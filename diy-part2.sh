#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate

#wifi固件
mkdir -p target/linux/rockchip/armv8/base-files/lib/firmware/brcm
mkdir -p package/base-files/lib/firmware/brcm
cp  ../brcm/* target/linux/rockchip/armv8/base-files/lib/firmware/brcm
cp  ../brcm/* package/base-files/lib/firmware/brcm

# 使用特定的优化
sed -i 's,-mcpu=generic,-mcpu=cortex-a72.cortex-a53+crypto,g' include/target.mk