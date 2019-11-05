#!/bin/bash -eux

DISK_USAGE_BEFORE_CLEANUP=$(df -h /)

rm -f /etc/machine-id
touch /etc/machine-id

# should output one of 'redhat' 'centos' 'oraclelinux'
distro="`rpm -qf --queryformat '%{NAME}' /etc/redhat-release | cut -f 1 -d '-'`"

echo "==> Cleaning up temporary network addresses"
# Make sure udev doesn't block our network
# http://6.ptmc.org/?p=1649
if grep -q -i "release 6" /etc/redhat-release ; then
    rm -f /etc/udev/rules.d/70-persistent-net.rules
    mkdir /etc/udev/rules.d/70-persistent-net.rules

    for ndev in `ls -1 /etc/sysconfig/network-scripts/ifcfg-*`; do
    if [ "`basename $ndev`" != "ifcfg-lo" ]; then
        sed -i '/^HWADDR/d' "$ndev";
        sed -i '/^UUID/d' "$ndev";
    fi
    done
fi
# Better fix that persists package updates: http://serverfault.com/a/485689
touch /etc/udev/rules.d/75-persistent-net-generator.rules
for ndev in `ls -1 /etc/sysconfig/network-scripts/ifcfg-*`; do
    if [ "`basename $ndev`" != "ifcfg-lo" ]; then
        sed -i '/^HWADDR/d' "$ndev";
        sed -i '/^UUID/d' "$ndev";
    fi
done
rm -rf /dev/.udev/

if [[ $CLEANUP_BUILD_TOOLS  =~ true || $CLEANUP_BUILD_TOOLS =~ 1 || $CLEANUP_BUILD_TOOLS =~ yes ]]; then
    echo "==> Removing tools used to build virtual machine drivers"
    yum -y -q remove gcc libmpc mpfr cpp kernel-devel kernel-headers
fi

# remove ansible
yum -y -q remove ansible

echo "==> Clean cache, remove temp files and rebuild RPM database..."
yum -y -q --enablerepo='*' clean all

rm -rf /tmp/*

rpmdb --rebuilddb
rm -f /var/lib/rpm/__db*

# delete any logs that have built up during the install
find /var/log/ -name *.log -exec rm -f {} \;

DISK_USAGE_AFTER_CLEANUP=$(df -h /)

echo "==> Disk usage before cleanup script"
echo "${DISK_USAGE_BEFORE_CLEANUP}"

echo "==> Disk usage after cleanup script"
echo "${DISK_USAGE_AFTER_CLEANUP}"