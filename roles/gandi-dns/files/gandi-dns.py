#!/usr/bin/env python3

import xmlrpc.client
import configparser
import platform
import netifaces
import base64
import time
import sys

config = configparser.ConfigParser()

for filename in sys.argv[1:]:
    config.read(filename)
    hostname = platform.node()
    myip = netifaces.ifaddresses(config['interface']['name'])[2][0]['addr']

    token = config['auth']['token']
    domain = config['domain']['name']
    api = xmlrpc.client.ServerProxy('https://rpc.gandi.net/xmlrpc/')

    if config.has_section('nameservers'):
        for sysname in config['nameservers']:
            if sysname == hostname:
                result = api.domain.host.update(token,
                                       config['nameservers'][sysname] + '.' + domain,
                                       [myip]
                                      )
                print(result)

    if config.has_section('dnssec'):
        # We need to delete the old keys before we can add the new ones.
        keys = api.domain.dnssec.list(token, domain)
        for key in keys:
            api.domain.dnssec.delete(token, key["id"])

        # We need to wait a bit or Gandi barfs
        time.sleep(10)

        # Now we can add our new keys.
        with open(config['dnssec']['ksk-file']) as file:
            for line in file:
                if line[0] != ';':
                    params = {
                        'algorithm': int(line.split()[5]),
                        'flags': 257,
                        'public_key': ' '.join(line.split()[6:])
                    }

                    print(params['public_key'])
                    result = api.domain.dnssec.create(token, domain, params)
                    print(result)