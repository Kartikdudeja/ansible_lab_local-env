# Setup an Ansible Lab

Vagrantfile will be used to Setup the VMs, It will bring up an Ansible Master which will be used as a Center Node for Deployment, and it will create two more target hosts.

Bash Script will create an 'ansible' user and setup password less login using ssh keys so the Control Node can access the target node to perform the defined action.
