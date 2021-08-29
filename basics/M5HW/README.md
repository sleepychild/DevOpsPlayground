# HOMEWORK M5

## Assignment

> With the help of the tools studied so far, try to create an environment like the one used during the third part of the
module, but this time with the following components...

As per usual 

```./deploy.sh | tee deploy.log``` gives us deploy.log

Execution follows these top level calls:
1. ./deploy.sh
2. vagrant up
3. provision.sh
4. provision_ansible.sh

Playbooks run from provision_ansible.sh:
1. /sync/base_playbook.yml
  * setup hostnames
2. /sync/servers_playbook.yml
  * install basic packages
3. /sync/jenkins_slave_playbook.yml
  * install java
  * setup jenkins user
4. /sync/jenkins_master_playbook.yml
  * install java
  * install jenkins
  * setup jenkins user
5. /sync/docker_install_playbook.yml
  * install docker
6. /sync/docker_swarm_playbook.yml
  * init docker swarm
  * setup docker registry
7. /sync/docker_join_playbook.yml
  * node 2 joins docker swarm as worker
  * setup remote context so that node-2 can work with the swarm as a client

Jenkins sometimes manages to catch the fact that it is already provisioned and sometimes not.

If it doesn't the manual steps are:
1. http://localhost:8080
2. Unlock jenkins with password from sync/initialAdminPassword
3. Login admin / vagrant
4. Install Sugested Plugins

If it does in several minutes the application will be deployed to the swarm by node-2 and become accesible on http://localhost:9000.

## NOTES

There is a 5 MB limit for the homework so there should be no way for this deployment to work out of the box because jenkins won't start with the plugins needed that are 200 MB.

If the plugins are available but /sync/docker_join_playbook.yml fails than:
1. Run "Provision/Docker/Docker Join" job in jenkis in order to provision node-2.
2. Delete failed builds for "Deploy/Build Test App" in order to force a redeployment.

## P.S.
Jenkins is on the way out. Concourse or github actions are what will be used in the near future.