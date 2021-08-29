# HOMEWORK M4

To document the results I logged the output of the ```vagrant up``` command into ```process.log``` and then the output of ```curl localhost:8080``` to ```result.log``` for the tasks in their respective folders.

## Task 1

> With the help of Ansible and Vagrant create Docker host and run a nginx container in it. You can use a role downloaded from Ansible Galaxy, or create the playbook all by yourself

I use a public vagrant box for openSUSE Leap 15.2 to serve as the docker host. I use a provision script to install python3 and pip so that ansible has access to it during provisioning.

I use my self made alpine_box to create the ansible host. I use the vagrant provisioning to both install configure ansible and start the playbooks. The ```install_docker.yml``` playbook uses a docker_host role to install docker on Suse. Then the ```run_nginx_container.yml``` playbook uses the docker_container module to run a generic nginx:stable-alpine container.

## Task 2

> With the help of Ansible and Vagrant create a two-host setup: yada yada ...

I reuse the ansible box from the first task but it's now based on a generic alpine box from [ROBOXES.ORG](https://roboxes.org/).

I reuse the public opensuse box from *Task 1* ( because FUCK CentOS after 200 manual installs on second hand refurbished dell servers from kvant service ) for the database instance.

I use a public ubuntu focal box for the web server. I use password authentication so I had to fix the sshd_config in the provision script.

The ansible box provision script installs the ansible community.mysql module collection for provisioning the database. Then runs a playbook that sets the roles for the database and webserver. I add entries to both systems's hosts files. Then I install mariadb and nginx on the database and webserver instances using the apt and zypper modules.

For the webserver I use copy to upload nginx configuration and builtin file to link it to the sites available.

For the database I use the lineinfile module to add the ```bind-address = 0.0.0.0``` to mariadb my.cnf. I use the mysql_user module to remove the anonymous users. The mysql_db module fails to create the database for some reason so I call shell to execute the database setup script and create a file indicating the command has been run so that it wouldn't re execute the script on subsequent playbook runs.

### Note

Vagrant / VirtualBox opensuse/Leap-15.2.x86_64 can't set the netmask of a private network to 24 and sets it to 32 if the netmask paramater is set.

```ruby
node.vm.network "private_network",
  name: "vboxnet0",
  ip: "10.1.1.3",
  # netmask: "24", BUG: this line the mask gets set to 32
  hostname: true
```
