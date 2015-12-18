#!/bin/sh -e
#
# Install a statically linked busybox binary to $INSTALL_PREFIX/bin
#
# Static busybox needs static library dependencies and on CentOS6 we need
#
#	yum install -y glibc-static
#
# In case those applets are installed accidentally as symbolic links
#
#	for f in $(find . -type l) ; do i="$(readlink -f "$f")"; i="$(basename "$i")"; [ "$i" = busybox ] && rm -vf $f; done
#
PKG_NAME=busybox
PKG_VERSION=1.24.1
PKG_SOURCE="$PKG_NAME-${PKG_VERSION}.tar.bz2"
PKG_SOURCE_URL="http://busybox.net/downloads/$PKG_SOURCE"
PKG_SOURCE_MD5SUM="be98a40cadf84ce2d6b05fa41a275c6a"

. "$PWD/env.sh"
. "$PWD/utils-kconfig.sh"

EXTRA_CFLAGS=
EXTRA_CPPFLAGS=
EXTRA_LDFLAGS=

configure() {
	cd "$PKG_BUILD_DIR"
	if [ -s ".config" ]; then
		mv ".config" ".config.old"
	fi
	# 1. link statically
	# 2. syncfs() for fancy sync is not available in debian wheezy 3.2.0 kernel, so disable it
	make defconfig
	set_option CONFIG_STATIC y
	set_option CONFIG_FEATURE_SYNC_FANCY n
	set_option CONFIG_INSTALL_APPLET_SYMLINKS n
	set_option CONFIG_INSTALL_APPLET_DONT y
	set_option CONFIG_PREFIX "\"$_PKG_STAGING_DIR/$INSTALL_PREFIX\""
}

main
