#!/bin/bash
# Author:  yeho <lj2007331 AT gmail.com>
#
# This script's project home is:
#       https://lempstack.com
#       https://github.com/lj2007331/lempstack

Install_APCU()
{
cd $lemp_dir/src
. ../functions/download.sh
. ../options.conf

src_url=http://pecl.php.net/get/apcu-$apcu_version.tgz && Download_src
tar xzf apcu-$apcu_version.tgz
cd apcu-$apcu_version
make clean
$php_install_dir/bin/phpize
./configure --with-php-config=$php_install_dir/bin/php-config
make && make install
if [ -f "$php_install_dir/lib/php/extensions/`ls $php_install_dir/lib/php/extensions | grep zts`/apcu.so" ];then
	cat >> $php_install_dir/etc/php.ini << EOF
extension = apcu.so
apc.enabled=1
apc.shm_size=32M
apc.ttl=7200
apc.enable_cli=1
EOF
	service php-fpm restart
	/bin/cp apc.php $home_dir/default
else
        echo -e "\033[31meAPCU module install failed, Please contact the author! \033[0m"
fi
cd ../../
}
