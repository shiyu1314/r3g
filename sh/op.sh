#!/bin/bash


function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../
  cd .. && rm -rf $repodir
}

echo 'src-git xd https://github.com/shiyu1314/openwrt-packages' >>feeds.conf.default


git_sparse_clone "$REPO_BRANCH" https://github.com/immortalwrt/luci modules/luci-base
git_sparse_clone "$REPO_BRANCH" https://github.com/immortalwrt/luci modules/luci-mod-status

git clone -b main --depth 1 --single-branch https://github.com/AngelaCooljx/luci-theme-material3 package/luci-theme-material3
# luci-theme-material3
rm -rf package/luci-theme-material3/{.git,Readme.md}
sed -i 's|../../luci.mk|$(TOPDIR)/feeds/luci/luci.mk|' package/luci-theme-material3/Makefile
sed -i '/uci -q delete luci.themes.Material3Red/a \	uci set luci.main.mediaurlbase=\x27/luci-static/bootstrap\x27' package/luci-theme-material3/Makefile
rm -rf package/luci-theme-material3/root/etc/uci-defaults/30_luci-theme-material3
echo '#!/bin/sh

if [ "$PKG_UPGRADE" != 1 ]; then
	uci get luci.themes.material3 >/dev/null 2>&1 || \
	uci batch <<-EOF
		set luci.themes.material3=/luci-static/material3
		set luci.main.mediaurlbase=/luci-static/material3
		commit luci
	EOF
fi

exit 0' > package/luci-theme-material3/root/etc/uci-defaults/30_luci-theme-material3 && chmod +x package/luci-theme-material3/root/etc/uci-defaults/30_luci-theme-material3


./scripts/feeds update -a
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh

rm -rf feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
cp -rf luci-base feeds/luci/modules
cp -rf luci-mod-status feeds/luci/modules/





# tcp-brutal
git clone https://github.com/sbwml/package_kernel_tcp-brutal package/kernel/tcp-brutal




./scripts/feeds update -a
./scripts/feeds install -a

sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

sed -i "s/192.168.1.1/$OP_IP/" package/base-files/files/bin/config_generate

sed -i "s/hostname='.*'/hostname='$name'/g" ./package/base-files/files/bin/config_generate

sudo rm -rf package/base-files/files/etc/banner

sed -i "s/%D %V %C/%D %V $(TZ=UTC-8 date +%Y.%m.%d)/" package/base-files/files/etc/openwrt_release

sed -i "s/%R/by $OP_author/" package/base-files/files/etc/openwrt_release

date=$(date +"%Y-%m-%d")
echo "                                                    " >> package/base-files/files/etc/banner
echo "  _______                     ________        __" >> package/base-files/files/etc/banner
echo " |       |.-----.-----.-----.|  |  |  |.----.|  |_" >> package/base-files/files/etc/banner
echo " |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|" >> package/base-files/files/etc/banner
echo " |_______||   __|_____|__|__||________||__|  |____|" >> package/base-files/files/etc/banner
echo "          |__|" >> package/base-files/files/etc/banner
echo " -----------------------------------------------------" >> package/base-files/files/etc/banner
echo "         %D ${date} by $OP_author                     " >> package/base-files/files/etc/banner
echo " -----------------------------------------------------" >> package/base-files/files/etc/banner
