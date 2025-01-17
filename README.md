# LEMPSTACK
LEMP / LNMP(Linux + Nginx+ MySQL+ PHP)

# How to install ?
- Just type the command below :
``` bash
sh Install_LEMP.sh
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
- finish and exit
```bash
exit
```

# NGINX Configuration
- Create the root web directory for your_domain
```bash
sudo mkdir /var/www/your_domain
```
- Create a new configuration file in sites-available
```bash
sudo nano /etc/nginx/sites-available/your_domain
```
- Insert the configuration below:
```bash
server {
    listen 80;
    server_name your_domain www.your_domain;
    root /var/www/your_domain;

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
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
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
