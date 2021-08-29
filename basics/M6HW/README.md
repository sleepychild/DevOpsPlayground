# HOMEWORK M6

##Assignment

> 1) With the help of the tools studied so far, try to create an environment like the one used during the third part
(one Nagios host and one Docker host with NRPE installed) of the module, but do it in an automated fashion
and try to avoid any manual tasks to the extent possible

As before running ```./deploy.sh``` should bring everything up.

If docker swarm nodes fail to join ( as they sometimes do ) open jenkins and run "Provision/Docker/Docker Join".

If the app fails to deploy ( as it sometimes does ) open jenkins and delete the builds for "Deploy/Build Test App".

Docker is running in swarm mode so when we pull image data the names are long and weird and need to be changed manually after deployment. The script to check the docker containers is NOT GOOD. The nrpe user doesnt share the context from vagrant user so it asks about containers localy. Had to fix it so that it creates the correct remote context. So fail. Service definition needs to be done manually after the containers are running in the stack.

In ubuntu with nagios4 there is a folder for adding .cfg files "/etc/nagios4/conf.d/". There I have my infra folder with all the configs. This way it's easyer to have jenkins sync them between deployments. There we 

service-node2-docker.cfg --template
```
define service {
    use                     remote-service
    host_name               node-2.lab
    service_description     {container 1 name} Running
    check_command           check-nrpe-arg!check-docker-container!{container 1 name}
}

define service {
    use                     remote-service
    host_name               node-2.lab
    service_description     {container 2 name} Running
    check_command           check-nrpe-arg!check-docker-container!{container 2 name}
}

```

> 2) Download and experiment with Icinga. Try to create similar environment (as in whichever part you choose
from the practice) and repeat some of the activities