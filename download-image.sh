#!/bin/bash
cd $(dirname $0 | pwd)
# 获取安装镜像地址
if [ `dpkg --print-architecture` == "i386" ]; then 
    python3 get-newest-version.py x86 VANILLA
fi
if [ `dpkg --print-architecture` == "amd64" ]; then 
    python3 get-newest-version.py x86_64 VANILLA
fi
if [ `dpkg --print-architecture` == "armhf" ]; then 
    python3 get-newest-version.py arm VANILLA
fi
if [ `dpkg --print-architecture` == "arm64" ]; then 
    python3 get-newest-version.py arm64 VANILLA
fi
urlSystem=`cat /tmp/url.txt`
urlVendor=`cat /tmp/vendorurl.txt`
uSystem=`dirname $urlSystem`
uVendor=`dirname $urlVendor`
rm -fv $uSystem $uVendor
aria2c -x 16 -s 16 $urlSystem
aria2c -x 16 -s 16 $urlVendor
uSystem=`dirname $urlSystem`
uVendor=`dirname $urlVendor`
unzip `basename $uSystem`
unzip `basename $uVendor`