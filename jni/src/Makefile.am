bin_PROGRAMS = App

App_SOURCES = main.c
Appdir      = $(includedir)

all-local: Android.mk

Android.mk: Makefile.am
	androgenizer \
	-:PROJECT App \
	-:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
	-:EXECUTABLE App \
	-:SOURCES $(App_SOURCES) \
> $@
