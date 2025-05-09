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


git_sparse_clone openwrt-23.05 https://github.com/immortalwrt/luci modules/luci-base
git_sparse_clone openwrt-23.05 https://github.com/immortalwrt/luci modules/luci-mod-status

git clone -b openwrt-24.10 --depth 1 --single-branch https://github.com/sbwml/luci-theme-argon package/xd/luci-theme-argon


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
