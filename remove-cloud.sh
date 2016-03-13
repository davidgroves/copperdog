#!/usr/bin/env bash

export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -vvvv -e@secrets.yml --vault-password-file vault.key playbook-undeploy.yml
