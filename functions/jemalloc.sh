#!/bin/bash
# Author:  yeho <lj2007331 AT gmail.com>
#
# This script's project home is:
#       https://lempstack.com
#       https://github.com/lj2007331/lempstack

Install_jemalloc()
{
cd $lemp_dir/src
. ../functions/download.sh

src_url=http://www.canonware.com/download/jemalloc/jemalloc-$jemalloc_version.tar.bz2 && Download_src

tar xjf jemalloc-$jemalloc_version.tar.bz2
cd jemalloc-$jemalloc_version
./configure
make && make install
if [ -f "/usr/local/lib/libjemalloc.so" ];then
        echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf
        ldconfig
else
        echo -e "\033[31mjemalloc install failed, Please contact the author! \033[0m"
        kill -9 $$
fi
cd ..
/bin/rm -rf jemalloc-$jemalloc_version
cd ..
}
