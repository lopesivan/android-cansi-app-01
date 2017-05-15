SUBDIRS = src

Android.mk: Makefile.am
	@echo 'LOCAL_PATH := $$(call my-dir)'    >  $@
	@echo 'include $$(all-subdir-makefiles)' >> $@

