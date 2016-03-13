#!/usr/bin/env bash

if [ x$1 == x ]; then
    FILENAME=secrets.yml
else
    FILENAME=$1
fi

ansible-vault edit $FILENAME --vault-password-file vault.key