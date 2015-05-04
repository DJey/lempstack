   This script is free collection of shell scripts for rapid deployment of `LEMP` stacks (Linux, Nginx, MySQL, PHP) for CentOS/Redhat Debian and Ubuntu.

   Script features: 
- Constant updates 
- Source compiler installation, most source code is the latest stable version, and downloaded from the official website
- Fixes some security issues 
- You can freely choose to install database version (MySQL-5.6, MySQL-5.5, MariaDB-10.0, MariaDB-5.5, Percona-5.6, Percona-5.5)
- You can freely choose to install PHP version (php-5.3, php-5.4, php-5.5, php-5.6, php-7/phpng(alpha))
- You can freely choose to install Nginx or Tengine
- According to their needs can to install ZendOPcache, xcache, APCU, eAccelerator, ionCube and ZendGuardLoader (php-5.4, php-5.3)
- According to their needs can to install Pureftpd, phpMyAdmin
- According to their needs can to install memcached, redis
- According to their needs can to optimize MySQL and Nginx with jemalloc or tcmalloc
- Add a virtual host script provided
- Nginx/Tengine, PHP, Redis, phpMyAdmin upgrade script provided
- Add backup script provided

## How to use 

```bash
   yum -y install wget git screen # for CentOS/Redhat
   #apt-get -y install wget git screen # for Debian/Ubuntu 
   git clone https://github.com/lj2007331/lempstack.git
   cd lempstack && chmod +x install.sh
   # Prevent interrupt the installation process. If the network is down, 
   # you can execute commands `screen -r lempstack` network reconnect the installation window.
   screen -S lempstack 
   ./install.sh
```

## How to add a virtual host

```bash
   ./vhost.sh
```

## How to backup

```bash
   ./backup_setup.sh # Set backup options 
   ./backup.sh # Start backup, You can add cron jobs
   # crontab -l # Examples 
     0 1 * * * cd ~/lempstack;./backup.sh  > /dev/null 2>&1 &
```

## How to manage service
Nginx/Tengine:
```bash
   service nginx {start|stop|status|restart|reload|configtest}
```
MySQL/MariaDB/Percona:
```bash
   service mysqld {start|stop|restart|reload|status}
```
PHP:
```bash
   service php-fpm {start|stop|restart|reload|status}
```
Pure-Ftpd:
```bash
   service pureftpd {start|stop|restart|status}
```
Redis:
```bash
   service redis-server {start|stop|status|restart|reload}
```
Memcached:
```bash
   service memcached {start|stop|status|restart|reload}
```

## How to upgrade 
```bash
   ./upgrade_php.sh # upgrade PHP
   ./upgrade_web.sh # upgrade Nginx/Tengine
   ./upgrade_redis.sh # upgrade Redis 
   ./upgrade_phpmyadmin.sh # upgrade phpMyAdmin 
```

## How to uninstall 

```bash
   ./uninstall.sh
```

## Installation
   Follow the instructions in [Wiki Installation page](https://github.com/lj2007331/lempstack/wiki/Installation)<br />

   For feedback, questions, and to follow the progress of the project: <br />
   [LEMP stack](https://lempstack.com)<br />
