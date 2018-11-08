#!/bin/sh -eux

# Install Ansible.
apt-get -y install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get -y update
apt-get -y install ansible