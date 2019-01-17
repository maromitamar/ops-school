#!/bin/bash
#add fix to exercise3 here
sudo sed '0,/deny from all/s//Allow from all/' -i /etc/apache2/sites-available/default
sudo service apache2 restart
