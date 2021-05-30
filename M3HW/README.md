# HOMEWORK M3

## Task 1

> Try to create a Vagrantfile which creates a Docker Swarm cluster with 3 nodes

Decided to make a new alpine base box for the docker hosts. The vagrant docker provisioner capability is not available on alpine. So I made an extended alpine base box with docker installed and configured for remote access.

In order to track state between the docker hosts I made two scripts that create / clear a state file holding the ip address of each host and the manager / worker tokens used for swarm join. The file is held in a synced_folder so it can be available to all the hosts.

The swarm up and down scripts call the vagrant up and destroy command. The vagrant file uses an index loop that creates multiple instances of the docker host box. The provision script decides how to provision the given system based on the index.

By the way. All the files and the state and everything else pretty much should be in git. Weird that the devops course started with vagrant and not with github.

## Task 2

> Create own docker-compose.yml file with yada yada yada

Have not used docker in a while. Swarm and stacks are new to me. docker-compose push works with an image send to localhost:5000 but doesn't deploy on the swarm b/c the other docker hosts don't see the image registry on localhost. Had to make a bridge connection with an ip accesible on the local network to get them to pull the images.

Unfortunatley they try to acces the registry on https by default. So I added a to the provision script to add the accessible address to the insecure "insecure-registries" list.

