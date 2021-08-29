#!/bin/bash

echo "* Start a NGINX container ..."
docker container run -d --name dob-http -p 80:80 -v /vagrant/web:/usr/share/nginx/html nginx