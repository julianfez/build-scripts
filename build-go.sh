#!/bin/sh -e
#
# Copyright 2015-2016 (c) Yousong Zhou
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Building go1.5 and newer versions requires go1.4 to bootstrap
#
# The ports for Snow Leopard (Apple OS X 10.6) are no longer released as a
# download or maintained since Apple no longer maintains that version of the
# operating system.
#
# - Release History, https://golang.org/doc/devel/release.html
# - Go 1.5 Release Notes, https://golang.org/doc/go1.5
#
PKG_NAME=go
PKG_VERSION=1.7.4
PKG_SOURCE="$PKG_NAME$PKG_VERSION.src.tar.gz"
PKG_SOURCE_URL="https://storage.googleapis.com/golang/$PKG_SOURCE"
PKG_SOURCE_MD5SUM=49c1076428a5d3b5ad7ac65233fcca2f
PKG_DEPENDS=go1.4

. "$PWD/env.sh"
. "$PWD/utils-go.sh"

GOROOT_BOOTSTRAP="$INSTALL_PREFIX/go/goroot-1.4.3"
