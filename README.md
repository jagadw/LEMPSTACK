# LEMP stack
LEMP / LNMP(Linux + Nginx+ MySQL+ PHP)

# How to install ?
- Just type the command below :
``` bash
sh install.sh
```

# MYSQL Setup
- First, you need to start the mysql service
- Start mysql service
```bash
systemctl start mysql
```
- When the installation is finished, it’s recommended that you run a security script that comes pre-installed with MySQL.
```bash
mysql_secure_installation
```
- Follow the instruction untill finish
- Restart the mysql service
```bash
systemctl restart mysql
```
- Login to mysql from terminal with your previous password from first setup
```bash
mysql -u root -p
```
- Change the authentication method for root as mysql_native_password to support login in phpmyadmin
```bash
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
```
- Reload grant tables
```bash
FLUSH PRIVILEGES;
```
- Finish and exit
```bash
exit
```

# NGINX Configuration
- Create the root web directory
```bash
sudo mkdir /var/www/your_webname
```
- Create a new configuration file in sites-available
```bash
sudo nano /etc/nginx/sites-available/your_webname
```
- Insert the configuration below:
```bash
server {
    listen 80;
    server_name (localhost / your_domain / www.your_domain);
    root /var/www/your_webname;

    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}
```
- Create a link to the configuration file from sites-enabled directory:
```bash
sudo ln -s /etc/nginx/sites-available/your_webname /etc/nginx/sites-enabled/
```
- unlink the default configuration file from the /sites-enabled/ directory:
```bash
sudo unlink /etc/nginx/sites-enabled/default
```
- Test the configuration
```bash
sudo nginx -t
```
If any errors are reported, go back to your configuration file to review its contents before continuing.
- Last step, reload Nginx to apply the changes:
```bash
sudo systemctl reload nginx
```
# Check the PHP with NGINX
- Create a new file with name info.php :
```bash
nano /var/www/your_webname/info.php
```
- Add the following lines into the new file :
```bash
<?php
phpinfo();
?>
```
- Visit the localhost or (domain name / public IP address) you’ve set up in your Nginx configuration file, followed by /info.php:
```bash
http://(localhost/your_domain/public_ip)/info.php
```
If the web page show you the detailed information about your server, You are done!

# PHPMYADMIN (optional)
- Download the phpmyadmin
- Extract it
- Move the phpmyadmin folder :
```bash
sudo mv phpmyadmin /var/www/phpmyadmin
```
- Paste the link below into your browser:
```bash
http://(localhost/your_domain/public_ip)/phpmyadmin/
```
You will see the phpmyadmin login page.

# FINISH
- Additional: Read the basic_operation.txt
- Note: Make sure the PHP, Nginx, and MySQL services are active.
