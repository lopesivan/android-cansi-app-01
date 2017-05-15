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
create_dir()
{
    local data_dir=/data/$1

echo "= create $data_dir ="

adb shell << EOF
su
mkdir $data_dir
chmod 777 $data_dir


EOF
}

send_native_program()
{
    local program=$1
    local data_dir=/data/$2

echo = send $program =

adb push $program $data_dir

program=${program##*/}
echo = set permissions $program=
adb shell << EOF
su
chmod 744 $data_dir/$program


EOF
}

isDir=$(adb shell busybox "test -d /data/$install_dir && echo yes || echo no" | dos2unix )
if [ "x$isDir" == "xyes" ]; then
    echo "The directory exists"

    for p in ${programs[*]}; do
        send_native_program $p $install_dir
    done

else
    echo "Directory does not exist"

    create_dir $install_dir

    for p in ${programs[*]}; do
        send_native_program $p $install_dir
    done
fi

# ----------------------------------------------------------------------------
exit 0
