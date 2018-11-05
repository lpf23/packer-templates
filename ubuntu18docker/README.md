ubuntu1804docker
-------------
Vagrant box built with Packer
- ubuntu-18.04.1-server-amd64.iso
- Provisioned with Ansible Galaxy Roles
	- packer-debian
	- docker

After the build completes a .box file can be found in the builds directory.

Commands
--------
packer build -var 'version=0.0.1' -force ubuntu1804.json
vagrant box add ubuntu1804docker virtualbox-ubuntu1804.box

TODO
----
- Figure out how to use local ansible roles during provision phase
- Create Hyper-V provider
- Create Docker provider
- Create VMWare provider