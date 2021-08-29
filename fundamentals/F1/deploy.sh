#!/usr/bin/env bash

# Update boxes
vagrant box update

# Vagrant
vagrant up

# Create docker context
docker context create remote --default-stack-orchestrator=swarm --docker host=tcp://localhost:2375
docker context use remote

# Terraform
terraform init
terraform validate
terraform plan --out main.plan
terraform apply main.plan
