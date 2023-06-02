#!/bin/bash

# Create Ansible User & Group and Generate ssh-key

USER_NAME="ansible"
GROUP_NAME="ansible"

# create group
sudo groupadd $GROUP_NAME

# create user
sudo useradd -g $GROUP_NAME $USER_NAME

# set password for the newly create user
sudo -i
USER_NAME="ansible"
SET_PASSWORD="ansible"
echo $SET_PASSWORD | passwd --stdin $USER_NAME

# create ssh-key
USER_NAME="ansible"
sudo su - $USER_NAME
echo | ssh-keygen -P ''

# copy ssh key to ansible controller node
REMOTE_HOST_USERNAME="ansible"
REMOTE_HOSTNAME="ansible-node01"
ssh-copy-id $REMOTE_HOST_USERNAME@$REMOTE_HOSTNAME
