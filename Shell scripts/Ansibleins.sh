#!/bin/bash
sudo yum -y install epel-repo
sudo yum -y update
sudo yum -y install ansible
ansible --version
ssh-keygen
