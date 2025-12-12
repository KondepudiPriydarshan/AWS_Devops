#!bin/bash

sudo bash -c 'cat > /hosts.txt << EOF
web1
web2
web3
EOF'
for host in `cat hosts` ; do scp /root/script.sh devops@$hosts:/tmp/ ; done
for host in `cat hosts` ; do ssh devops@$host bash /tmp/script.sh ; done
