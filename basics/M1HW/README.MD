# HOMEWORK M1

## Task 1

Created a virtual machine in virtualbox and installed the latest Ubuntu Server LTS. Then followed the steps to create a package as per the practise document and added it to Vagrant.

```bash
vagrant package --base ubuntu_20_04_lts
vagrant box add Ubuntu_Server_20_04_LTS package.box

vagrant box list
Ubuntu_Server_20_04_LTS    (virtualbox, 0)
shekeriev/centos-8-minimal (virtualbox, 0.3)

```

## Task 2

 Copied the version of the files where the shell scripts are separate from the Vagrantfile b/c I liked it better. Then changed the files so that it works on Ubuntu. Modified files included in archive.
