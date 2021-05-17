#!/bin/bash
sudo yum update -y
sudo yum install git
sudo cd /opt
sudo mkdir /opt/git
sudo cd /opt/git
sudo mkdir /opt/git/myscripts
sudo cd /opt/git/myscripts
sudo git init /opt/git/myscripts
sudo git config --global user.name "aditya"
sudo git config --global user.email "aditya.daida@gmail.com"
sudo git config --global --add color.ui true