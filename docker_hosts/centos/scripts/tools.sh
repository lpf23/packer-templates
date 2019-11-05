#!/bin/bash -eux

# Install Ansible.
yum install -y -q epel-release
yum install -y -q ansible
yum install -y -q bzip2 gcc make perl kernel-headers linux-headers-$(uname -r) kernel-devel yum-utils
yum install -y -q openssh-clients sudo selinux-policy-devel wget curl rsync
yum install -y -q device-mapper-persistent-data lvm2 git nfs-utils net-tools deltarpm

echo "==> tools.sh completed"