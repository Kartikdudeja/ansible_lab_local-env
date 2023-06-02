# Vagrantfile to Setup a Test lab for Ansible Practice

Vagrant.configure("2") do |config|

    # manages the /etc/hosts file on guest machines in multi-machine environments
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true

    ### Ansible Control Node ###
    config.vm.define "controller" do |controller|
        controller.vm.box = "geerlingguy/centos7"
        controller.vm.hostname = "ansible-controller"
        controller.vm.network "private_network", ip: "192.168.56.10"

        controller.vm.provider "virtualbox" do |vb|
            vb.name = "Ansible_Controller"
            vb.memory = "1024"
            vb.cpus = "1"
        end

        controller.vm.provision "shell", path: "./scripts/ansible-create-user.sh"

    end

    ### Ansible Node 01 ###
    config.vm.define "node01" do |node01|
        node01.vm.box = "geerlingguy/centos7"
        node01.vm.hostname = "ansible-node01"
        node01.vm.network "private_network", ip: "192.168.56.11"

        node01.vm.provider "virtualbox" do |vb|
            vb.name = "Ansible_Node01"
            vb.memory = "512"
            vb.cpus = "1"
        end

        node01.vm.provision "shell", path: "./scripts/ansible-create-user.sh"
    end

    ### Ansible Node 02 ###
    config.vm.define "node02" do |node02|
        node02.vm.box = "geerlingguy/centos7"
        node02.vm.hostname = "ansible-node02"
        node02.vm.network "private_network", ip: "192.168.56.12"

        node02.vm.provider "virtualbox" do |vb|
            vb.name = "Ansible_Node02"
            vb.memory = "512"
            vb.cpus = "1"
        end
        
        node02.vm.provision "shell", path: "./scripts/ansible-create-user.sh"
    end
end