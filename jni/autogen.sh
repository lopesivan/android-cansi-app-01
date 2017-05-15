#!/bin/bash

touch NEWS README AUTHORS ChangeLog

# rode autotools e configure, caso contrário aborte
autoreconf -i -v && ./configure || exit 1

find . -type f -name Makefile.am -printf "%h\n" |
	while read line; do
		d=$line
		(cd $d; make Android.mk)
	done

eval $(cat .env) # load variables

cd ..
# ndk-build has to be in the PATH for this to work
${ANDROID_NDK}/ndk-build V=1
