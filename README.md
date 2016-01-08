This script is free collection of shell scripts for rapid deployment of `LEMP` stacks (Linux, Nginx, MySQL, PHP) for CentOS/Redhat Debian and Ubuntu.

Script features: 
Script properties:
- Continually updated
- Source compiler installation, most stable source is the latest version, and download from the official site
- Some security optimization
- Providing a plurality of database versions (MySQL-5.7, MySQL-5.6, MySQL-5.5, MariaDB-10.1, MariaDB-10.0, MariaDB-5.5, Percona-5.6, Percona-5.5)
- Providing multiple PHP versions (php-5.3, php-5.4, php-5.5, php-5.6, php-7)
- Provide Nginx, Tengine
- According to their needs to install PHP Cache Accelerator provides ZendOPcache, xcache, apcu, eAccelerator. And php encryption and decryption tool ionCube, ZendGuardLoader
- Installation Pureftpd, phpMyAdmin according to their needs
- Install memcached, redis according to their needs
- Tcmalloc can use according to their needs or jemalloc optimize MySQL, Nginx
- Providing add a virtual host script
- Provide Nginx/Tengine, MySQL/MariaDB/Percona, PHP, Redis, phpMyAdmin upgrade script
- Provide local backup and remote backup (rsync between servers) script
- Provided under HHVM install CentOS 6,7

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

## How to add FTP virtual user

```bash
   ./pureftpd_vhost.sh
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
   ./upgrade.sh
```

## How to uninstall 

```bash
   ./uninstall.sh
```

## Installation
   Follow the instructions in [Wiki Installation page](https://github.com/lj2007331/lempstack/wiki/Installation)<br />

   For feedback, questions, and to follow the progress of the project: <br />
   [LEMP stack](https://lempstack.com)<br />
