#!/bin/bash

# Remove packages
#rm -rf feeds/packages/net/v2ray-geodata


# Add packages
#git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
#git clone  https://github.com/linkease/luci-app-linkease package/linkease
#git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky

# add luci-app-mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# 加入OpenClash核心
#chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
#$GITHUB_WORKSPACE/N1/preset-clash-core.sh

echo "
# 插件
CONFIG_PACKAGE_luci-app-amlogic=n
CONFIG_PACKAGE_luci-app-linkease=n
CONFIG_PACKAGE_luci-app-lucky=n
" >> .config

# 修改默认IP
sed -i 's/192.168.1.1/192.168.2.8/g' package/base-files/files/bin/config_generate

# 修改默认主题
#sed -i 's/luci-theme-design/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate


