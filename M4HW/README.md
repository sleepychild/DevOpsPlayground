# HOMEWORK M4

To document the results I logged the output of the ```vagrant up``` command into ```process.log``` and then the output of ```curl localhost:8080``` to ```result.log``` for the tasks in their respective folders.

## Task 1

> With the help of Ansible and Vagrant create Docker host and run a nginx container in it. You can use a role downloaded from Ansible Galaxy, or create the playbook all by yourself

I use a public vagrant box for openSUSE Leap 15.2 to serve as the docker host. I use a provision script to install python3 and pip so that ansible has access to it during provisioning.

I use my self made alpine_box to create the ansible host. I use the vagrant provisioning to both install configure ansible and start the playbooks. The ```install_docker.yml``` playbook uses a docker_host role to install docker on Suse. Then the ```run_nginx_container.yml``` playbook uses the docker_container module to run a generic nginx:stable-alpine container.

## Task 2

> With the help of Ansible and Vagrant create a two-host setup: yada yada ...

