#!/bin/sh
apt update
sudo apt install unzip
wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip
unzip ./terraform_1.1.7_linux_amd64.zip
sudo cp -r terraform /usr/local/bin/
sudo rm terraform terraform_*
