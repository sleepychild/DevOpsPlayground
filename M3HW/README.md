# HOMEWORK M3

I refuse to use docker-machine. Decided to make a new alpine base box for the docker hosts. The vagrant docker provisioner capability is not available on alpine. So I made an extended alpine base box with the docker setup for remote access.

Forgot to setup the local docker client to use tcp socket so provision scripts should include:

```bash
docker context create --docker host=tcp://localhost:2376 remote
docker context use remote
```
