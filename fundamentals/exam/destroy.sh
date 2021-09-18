#!/usr/bin/env bash
vagrant destroy --force --parallel

# Remove known hosts
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2200"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2201"
