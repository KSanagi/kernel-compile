#!/bin/bash
# run this with root privilege
LINUX_VERSION="4.9"
yum -y install rpm-build
yum -y groupinstall "Development Tools"
yum -y install rpmdevtools
yum -y install wget
yum -y install bc openssl-devel
yum -y install asciidoc hmaccalc perl-ExtUtils-Embed pesign xmlto
yum -y install audit-libs-devel binutils-devel elfutils-devel elfutils-libelf-devel
yum -y install ncurses-devel newt-devel numactl-devel pciutils-devel python-devel zlib-devel
rpmdev-setuptree
cd ~/rpmbuild/SOURCES
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-${LINUX_VERSION}.tar.xz
tar xvf linux-${LINUX_VERSION}.tar.xz
cd linux-${LINUX_VERSION}
cp /boot/config-`uname -r` .config
yes '' | make oldconfig
make rpm

#confirmed combination
# linux-4.9 with CentOS7.3
