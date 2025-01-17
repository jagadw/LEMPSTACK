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
