#!/usr/bin/env bash

test -n "$DEBUG" && set -x
#                      __ __       ___
#                     /\ \\ \    /'___`\
#                     \ \ \\ \  /\_\ /\ \
#                      \ \ \\ \_\/_/// /__
#                       \ \__ ,__\ // /_\ \
#                        \/_/\_\_//\______/
#                           \/_/  \/_____/
#                                         Algoritimos
#
#
#      Author: Ivan Lopes
#        Mail: ivan@42algoritmos.com.br
#        Site: http://www.42algoritmos.com.br
#     License: gpl
#       Phone: +1 561 801 7985
#    Language: Shell Script
#        File: a.sh
#        Date: Dom 07 Mai 2017 19:08:05 BRT
# Description:
# ----------------------------------------------------------------------------
# Modo strict
set -euo pipefail
# ----------------------------------------------------------------------------
install_dir=dev
programs=$@

##############################################################################
##############################################################################
##############################################################################
remove()
{
    local program=$1
    local data_dir=/data/$2

program=${program##*/}

echo rm $data_dir/$program
adb shell << EOF
su
rm $data_dir/$program


EOF
}

main()
{

isDir=$(adb shell busybox "test -d /data/$install_dir && echo yes || echo no" | dos2unix )

if [ "x$isDir" == "xyes" ]; then
    echo "The directory exists"

    for p in ${programs[*]}; do
        remove $p $install_dir
    done

else
    echo "Directory does not exist"

fi
}

# ----------------------------------------------------------------------------
# Run!
main
# ----------------------------------------------------------------------------
exit 0
