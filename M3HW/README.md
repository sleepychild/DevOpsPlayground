# HOMEWORK M3

## Task 1

> Try to create a Vagrantfile which creates a Docker Swarm cluster with 3 nodes

Decided to make a new alpine base box for the docker hosts. The vagrant docker provisioner capability is not available on alpine. So I made an extended alpine base box with docker installed and configured for remote access. Next version should also have python installed.

In order to track state between the docker hosts I made two scripts that create / clear a state file holding the ip address of each host and the manager / worker tokens used for swarm join. The file is held in a synced_folder so it can be available to all the hosts.

The swarm up and down scripts call the vagrant up and destroy command. The vagrant file uses an index loop that creates multiple instances of the docker host box. The provision script decides how to provision the given system based on the index.

By the way. All the files and the state and everything else pretty much should be in git. Weird that the devops course started with vagrant and not with github.

## Task 2

> Create own docker-compose.yml file with yada yada yada

Created a registry to store and distribute images across dockerhosts and gave it a local address over a bridged interface so that it can be visible and addresable directly and I can push images to it from my local docker client.

The deployment steps are documented in scripts.
 - swarm_up.sh
     - create state file
     - call vagrant up and provision.sh
         - write docker host data to state file
         - create local context for docker to see itself
         - init swarm on first host
         - join swarm for subsequent hosts
         - apply docker daemon fix for insecure registry
     - set docker context to talk to remote docker engine
     - create image registry
 - app/deploy.sh
     - build images
     - push images
     - deploy stack
 - swarm_down.sh
     - remove state file
     - clear vagrant deployment
     - set docker context back to default and delete remote

I don't have pictures this time. But I have a bunch of scripts.
