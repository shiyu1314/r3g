#!/bin/bash


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
echo ".___                               __         .__" >> package/base-files/files/etc/banner
echo "|   | _____   _____   ____________/  |______  |  |" >> package/base-files/files/etc/banner
echo "|   |/     \ /     \ /  _ \_  __ \   __\__  \ |  |" >> package/base-files/files/etc/banner
echo "|   |  Y Y  \  Y Y  (  <_> )  | \/|  |  / __ \|  |__" >> package/base-files/files/etc/banner
echo "|___|__|_|  /__|_|  /\____/|__|   |__| (____  /____/" >> package/base-files/files/etc/banner
echo "          \/      \/                        \/      " >> package/base-files/files/etc/banner
echo " -----------------------------------------------------" >> package/base-files/files/etc/banner
echo "         %D ${date} by shiyu1314                     " >> package/base-files/files/etc/banner
echo " -----------------------------------------------------" >> package/base-files/files/etc/banner
echo "                                                      " >> package/base-files/files/etc/banner
