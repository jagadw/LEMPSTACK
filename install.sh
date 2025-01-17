#!/usr/bin/env bash

# update & upgrade
sudo apt update
sudo apt upgrade

# install php
sudo apt install php8.1 php8.1-fpm php8.1-mysql

# install nginx
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'

# install mysql
sudo apt install mysql-server

echo 'Success!'
