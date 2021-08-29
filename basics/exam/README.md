# EXAM

Run ./deploy.sh calls vagrant up and provisions 3 virtual machines

Ansible and nagios are runnign together. Jenkins and docker are on seperate vms.

All vms use the provision.sh script for initial config and then the provision_ansible.sh script is called to run the playbooks.

Base playbook sets hostnames so that the machines can reference each other by name.

The servers playbook ensures all servers can have software installed on them via ansible.

We have nagios monitored playbook that sets up nrpe for docker and jenkins hosts.

Then nagios monitor playbook brings up nagios.

The docker install playbook installs docker.

Most of the jenkins confir is just copied from the sync folder. The plugins install uses a modified version of the jenkins install plugin from the materials.

Basically if nothing blows up is should deploy in one run without intervention after the ./deploy.sh command.

The only think missing is using a role from ansible galaxy as far as I can see. Otherwise ./deploy.sh should cover all the requirements.

### Nagios available at
http://localhost:8002/nagios4/
nagiosadmin / vagrant

### Jenkins available at
http://localhost:8001
admin / vagrant

### Application Available at
http://localhost:8000/