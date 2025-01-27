# Prerequisite
##  Switch pre-configuration
username admin privilege 15 secret
management api http-commands
   protocol http
   no shutdown

## Install ansible collection arista.eos
ansible-galaxy collection install arista.eos

## Run Ansible command
sudo ansible-playbook playbook.yml