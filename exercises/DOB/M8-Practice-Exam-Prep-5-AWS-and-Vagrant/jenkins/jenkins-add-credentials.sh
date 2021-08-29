#!/bin/bash

# 
# Create Jenkins credentials
# 

java -jar /opt/jenkins-cli.jar -auth admin:admin -s http://localhost:8080/ -http create-credentials-by-xml system::system::jenkins _ < /vagrant/credentials.xml