#!/bin/bash
# Author:  yeho <lj2007331 AT gmail.com>
#
# This script's project home is:
#       https://lempstack.com
#       https://github.com/lj2007331/lempstack

. ./options.conf
DB_Local_BK() {
	for D in `echo $db_name | tr ',' ' '`
	do
		cd $lemp_dir/tools
		./db_bk.sh $D
	done
}

DB_Remote_BK() {
        for D in `echo $db_name | tr ',' ' '`
        do
                cd $lemp_dir/tools
                ./db_bk.sh $D
		DB_GREP="DB_${D}_`date +%Y`"
                DB_FILE=`ls -lrt $backup_dir | grep ${DB_GREP} | tail -1 | awk '{print $NF}'`
                echo "file:::$backup_dir/$DB_FILE $backup_dir push" >> $lemp_dir/tools/config.txt
                echo "com:::[ -e "$backup_dir/$DB_FILE" ] && rm -rf $backup_dir/DB_${D}_$(date +%Y%m%d --date="$expired_days days ago")_*.tgz" >> $lemp_dir/tools/config.txt
        done
}

WEB_Local_BK() {
	for W in `echo $website_name | tr ',' ' '`
        do
                cd $lemp_dir/tools
                ./website_bk.sh $W
        done
}

WEB_Remote_BK() {
        for W in `echo $website_name | tr ',' ' '`
        do
		cd $lemp_dir/tools
                echo "file:::$home_dir/$W $backup_dir push" >> $lemp_dir/tools/config.txt
        done
}

if [ "$local_bankup_yn" == 'y' -a "$remote_bankup_yn" == 'n' ];then
	WEB_Local_BK
	DB_Local_BK
elif [ "$local_bankup_yn" == 'n' -a "$remote_bankup_yn" == 'y' ];then
	echo "com:::[ ! -e "$backup_dir" ] && mkdir -p $backup_dir" > $lemp_dir/tools/config.txt
	DB_Remote_BK
	WEB_Remote_BK
	./mabs.sh -T -1 | tee mabs.log	
elif [ "$local_bankup_yn" == 'y' -a "$remote_bankup_yn" == 'y' ];then
	echo "com:::[ ! -e "$backup_dir" ] && mkdir -p $backup_dir" > $lemp_dir/tools/config.txt
	WEB_Local_BK
	WEB_Remote_BK
	DB_Local_BK
	DB_Remote_BK
	./mabs.sh -T -1 | tee mabs.log	
fi
