#!/bin/bash

# Description: Create Ansible User & Group

USER_NAME="ansible"
GROUP_NAME="ansible"

# create group
sudo groupadd $GROUP_NAME

# create user and add to the group
sudo useradd -g $GROUP_NAME,wheel $USER_NAME

# set password for the newly create user
sudo -i
USER_NAME="ansible"
SET_PASSWORD="ansible"
echo $SET_PASSWORD | passwd --stdin $USER_NAME
