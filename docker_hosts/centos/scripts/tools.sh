#!/bin/bash -eux

# Install Ansible.
yum install -y epel-release
yum install -y ansible
yum install -y bzip2 gcc make perl kernel-headers kernel-devel yum-utils
yum install -y openssh-clients sudo selinux-policy-devel wget curl rsync
yum install -y device-mapper-persistent-data lvm2 git nfs-utils net-tools deltarpm