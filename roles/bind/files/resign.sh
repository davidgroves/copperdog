#!/usr/bin/env bash

ZONEFILE=$1

cd /etc/bind/keys

rm K${ZONEFILE}.*

KEYFILE=`dnssec-keygen -3 -f KSK -a RSASHA256 -b 2048 -n ZONE ${ZONEFILE}`
rm $ZONEFILE.ksk
ln -s $KEYFILE.key $ZONEFILE.ksk

KEYFILE=`dnssec-keygen -3 -a RSASHA256 -b 2048 -n ZONE ${ZONEFILE}`
rm $ZONEFILE.zsk
ln -s $KEYFILE.key $ZONEFILE.zsk

cd /etc/bind/zones
dnssec-signzone -g -d /etc/bind/keys -t -o ${ZONEFILE} ${ZONEFILE} /etc/bind/keys/K${ZONEFILE}*.private