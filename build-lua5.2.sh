#!/bin/sh -e
#
PKG_NAME=lua5.2
PKG_VERSION=5.2.4
PKG_SOURCE="lua-$PKG_VERSION.tar.gz"
PKG_SOURCE_URL="http://www.lua.org/ftp/$PKG_SOURCE"
PKG_SOURCE_MD5SUM=913fdb32207046b273fdb17aad70be13
PKG_BUILD_DIR_BASENAME="lua-$PKG_VERSION"

. "$PWD/env.sh"
. "$PWD/utils-lua.sh"
