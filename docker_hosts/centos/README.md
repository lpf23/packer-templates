centos7docker
-------------
Vagrant box built with Packer
- CentOS-7-x86_64-Minimal-1804.iso
- Provisioned with Ansible Galaxy Roles
	- lpf23.packer_rhel
	- lpf23.docker

After the build completes a .box file can be found in the builds directory.

Commands
--------
packer build centos7.json
packer build -force centos7.json # force the build to overwrite artifacts
packer build -var "version=0.0.1" centos7.json # pass a variable to the build

vagrant box add centos7docker virtualbox-centos7.box

TODO
----
- Figure out how to use local ansible roles during provision phase
- Create Hyper-V provider
- Create Docker provider
- Create VMWare provider