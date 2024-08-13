# Prerequisite
## Switch pre-configuration
set system login user admtech class super-user
set system services netconf ssh port 830


## Install ansible collection junos
ansible-galaxy collection install junipernetworks.junos