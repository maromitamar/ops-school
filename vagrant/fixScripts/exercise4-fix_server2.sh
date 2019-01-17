#!/bin/bash
#add fix to exercise4-server2 here
sudo grep -q '192.168.100.10  server1 server1' /etc/hosts || echo '192.168.100.10  server1 server1' | sudo tee -a /etc/hosts
