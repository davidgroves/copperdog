#!/usr/bin/env bash

cd /home/dwg/PycharmProjects/copperdog/PROJECTS/www
echo $1

if [ x$1 == x ]; then
    echo "As no hosts have been specified on the CLI, I will install to"
    echo "bach.copperdog.org and chopin.copperdog.org"
    HOSTS="bach.copperdog.org chopin.copperdog.org"
else
    HOSTS=$1
fi

nikola build

for HOST in $HOSTS; do
	rsync -avz --delete output/ $HOST:/data/websites/copperdog.org/
done