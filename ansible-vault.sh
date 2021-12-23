#!/bin/bash
ansible-vault decrypt in_var.yml --vault-password-file passwdfile.yml
ansible-playbook -i hosts install.yml