CentOS 7.5 docker host
----------------------
Vagrant box built with Packer
- CentOS-7-x86_64-Minimal-1804.iso
- Provisioned with Ansible Galaxy Roles
	- lpf23.docker
- 
- Tested with VirtualBox 5.2.20 and Hyper-V on Windows 10

After the build completes a .box file can be found in the builds directory.

Commands
--------

`packer build -only=virtualbox-iso -force centos-7.5-x86_64.json`

`packer build -only=hyperv-iso -force centos-7.5-x86_64.json`

`packer build -only= centos-7.5-x86_64.json`

Force the build to overwrite artifacts
`packer build -force centos-7.5-x86_64.json` 

Pass a variable to the build
`packer build -var "version=0.0.1" centos-7.5-x86_64.json`