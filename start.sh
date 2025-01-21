#!/usr/bin/env bash

systemctl start nginx
systemctl start mysql

echo 'Successfully start LEMP!'
