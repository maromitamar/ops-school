#!/bin/bash
#add fix to exercise5-server2 here
sudo echo '192.168.100.10  server1 server1' | sudo tee -a /etc/hosts
su - vagrant -c 'echo -e "\n" | ssh-keygen -t rsa -N ""'
sudo apt-get install sshpass
cat ~vagrant/.ssh/id_rsa.pub | sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=no vagrant@server1 'cat >> ~vagrant/.ssh/authorized_keys'
su - vagrant -c "ssh -o StrictHostKeyChecking=no vagrant@server1 'cat ~vagrant/.ssh/id_rsa.pub' | cat >> ~vagrant/.ssh/authorized_keys"
