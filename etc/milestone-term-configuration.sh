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
install_dir=tmp
programs=$@

##############################################################################
##############################################################################
##############################################################################
configure_term()
{
    local data_dir=/data/$1

    echo "= configure Term ="

    cat apk/jackpal.androidterm_preferences.xml |
        sed "s=__COMMAND__=(cd $data_dir; ./run.sh )=" > jackpal.androidterm_preferences.xml

}

send_file()
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
cp $data_dir/$program /data/data/jackpal.androidterm/shared_prefs/$program


EOF
}

main()
{

isDir=$(adb shell busybox "test -d /data/$install_dir && echo yes || echo no" | dos2unix )
if [ "x$isDir" == "xyes" ]; then
    echo "The directory exists"

    configure_term $install_dir
    send_file jackpal.androidterm_preferences.xml $install_dir

else
    echo "Directory does not exist"

fi
}

# ----------------------------------------------------------------------------
# Run!
main
# ----------------------------------------------------------------------------
exit 0
