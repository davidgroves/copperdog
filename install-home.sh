#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

if [ x$2 == x ]; then
    echo "Usage: install-home.sh [I/S] [pi_ipv4]"
    echo "Where I is for an initial install using default credentials and S is for subsequent installs"
    exit 1
fi

if [ x$1 == xI ]; then
    echo "Creating initial home.inv inventory file"
    echo "[pi]" > home.inv
    echo "homepi ansible_connection=ssh ssh_args=\"\" ansible_host=$2 ansible_user=pi ansible_ssh_pass=raspberry" >> home.inv
fi

if [ x$1 == xS ]; then
    echo "Creating subsequent home.inv inventory file"
    echo "[pi]" > home.inv
    echo "homepi ansible_connection=ssh ssh_args=\"\" ansible_host=$2 ansible_user=pi ansible_ssh_pass=raspberry" >> home.inv
fi

/usr/local/bin/ansible-playbook -vvvv -i home.inv playbook-home.yml