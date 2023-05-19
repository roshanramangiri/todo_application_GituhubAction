#! /bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2
sudo rm-rf /var/www/html/index.html
sudo cp -r /dist/todo/* /var/www/html/
sudo service apache restart
