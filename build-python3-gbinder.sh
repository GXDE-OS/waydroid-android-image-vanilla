#!/bin/bash
version=$1
arch=$2
systemPath=debian-$version
chrootRun=sudo chroot $systemPath
sudo apt install debootstrap -y
sudo debootstrap $version --arch=$2 $systemPath
sudo aria2c -d /usr/bin -o pardus-chroot https://github.com/gfdgd-xi/deep-wine-runner/raw/main/pardus-chroot
sudo chmod 777 /usr/bin/pardus-chroot
sudo pardus-chroot $systemPath
$chrootRun apt update
$chrootRun apt install sudo fakeroot dpkg-dev aria2 git wget -y
$chrootRun git clone https://github.com/waydroid/gbinder-python
sudo mkdir $systemPath/deb
aria2c http://jihulab.com/gfdgd-xi/waydroid-deb/-/raw/main/focal/libgbinder_1.1.25_amd64.deb?ref_type=heads -d deb
aria2c http://jihulab.com/gfdgd-xi/waydroid-deb/-/raw/main/focal/libglibutil_1.0.66_amd64.deb?ref_type=heads -d deb
$chrootRun apt install ./deb/*.deb
$chrootRun cd gbinder-python \; apt build-dep .
$chrootRun cd gbinder-python \; dpkg-buildpackage -b