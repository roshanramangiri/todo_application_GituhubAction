#! /bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo chmod -R 777 /var/www/html
sudo rm -rf /var/www/html/index.html

sudo service apache restart
