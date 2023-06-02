#!/bin/bash

# Description: setup ssh login via key; Run this Script on Ansible Controller Machine

# Pre-requisite: Add host machines to the known_hosts file '~/.ssh/known_hosts'

ANSIBLE_USERNAME="ansible"
CURRENT_USERNAME="$(whoami)"

REMOTE_HOST_USERNAME="ansible"
REMOTE_HOST_PASSWORD="ansible"

if [[ "$CURRENT_USERNAME" == "$ANSIBLE_USERNAME" ]]
then

    # generate ssh-key
    echo | ssh-keygen -P ''

    # loop over '/etc/hosts' file and copy ssh key to remote host
    for REMOTE_HOSTNAME in $(more /etc/hosts | sed '/^$/d' | grep -vE "^#|^127\.0|localhost" | grep '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | awk '{print $1}')
    do
        sshpass -p$REMOTE_HOST_PASSWORD ssh-copy-id -oStrictHostKeyChecking=no -f $REMOTE_HOST_USERNAME@$REMOTE_HOSTNAME
        sleep 10
    done

else
    echo "ERROR: Run this script as '$ANSIBLE_USERNAME' user"
    exit
fi
