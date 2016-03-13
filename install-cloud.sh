#!/usr/bin/env bash

export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -vvvv -e@secrets.yml --vault-password-file vault.key playbook-deploy.yml
echo "Sleeping 30 seconds to allow cloud instances to start"
echo "====================================================="
sleep 30
ansible-playbook -vvvv -i openstack.py -e@secrets.yml --vault-password-file vault.key playbook-provision.yml