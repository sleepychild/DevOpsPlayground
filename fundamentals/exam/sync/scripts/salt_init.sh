#!/usr/bin/env bash
sleep 1m
sudo salt "${1}" state.apply
