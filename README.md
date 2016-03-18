# copperdog
CopperDog Public Cloud Resources

# Things you need for this to work.
- Ansible (tested with Ansible 2.0.0.2)
- Python2 (tested with 2.7.6 and 2.8.10).
- Python3 (tested with Python 3.5.1)
- An SSH key that will be used for the admin account on the VM's. This
must be on the Openstack environment and the right name must be in the
creation script.
- The contents of the requirements.txt file (installed via pip3 install -r requirements.txt,
ideally installed in a virtual environment).

# Lists of things (cloud)
## User ID's
- Normal user ID's start at 1001.
 - dwg = 1001
 - leni = 1002
- Non user accounts start at 5000.
 - juypter = 5000
 - photos = 5001

## Ports used
 - TCP/22: Sshd
 - TCP/UDP/53: Bind.
 - TCP/80, TCP/443: Nginx.
 - TCP/8080: Jenkins
 - TCP/8888: Jupyter 

## Mount Points (Bach)
 - /dev/vdb: /data/juypter
 - /dev/vdc: /data/photos
 - /dev/vdd: /data/mysql
 - /dev/vde: /data/websites/files
 
## Mount Points (Chopin - Would be the same but for Ansible bugs)
 - /dev/vdb: /data/websites/files

## Dev Notes
- Every task should be broken down into Ansible roles so that what starts running on 2 systems
can, if required later be broken down into running on more.
- Ideally, where possible no service that runs on a specific system should preclude running
other services on the same machine. Sometimes (like with the real DNS service and the 
dnssrc service, this is in fact not possible).
