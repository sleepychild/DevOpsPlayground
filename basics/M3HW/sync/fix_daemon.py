#!/usr/bin/python3

import sys
import json

docker_daemon_conf = dict

with open("/etc/docker/daemon.json", "r") as f:
    docker_daemon_conf = json.load(f)

docker_daemon_conf.update({'insecure-registries': ['192.168.201.120:5000']})

with open("/etc/docker/daemon.json", "w") as f:
    json.dump(docker_daemon_conf, f)