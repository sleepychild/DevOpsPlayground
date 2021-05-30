#!/usr/bin/env bash

state_file="sync/state"

# If state file exists remove it
[[ -f $state_file ]] && rm $state_file

vagrant destroy --force --parallel
