#!/usr/bin/env bash

hosts_list=( main node1 node2 )

pushd /sync/salt/key/
    for hosts_list_item in "${hosts_list[@]}"
    do
        echo "Writing key for "${hosts_list_item}""
        salt-key --gen-keys="${hosts_list_item}"
    done
popd