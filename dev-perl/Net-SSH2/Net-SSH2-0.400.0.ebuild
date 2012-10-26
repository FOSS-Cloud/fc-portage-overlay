# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR=RKITOVER
MODULE_VERSION=0.40
inherit perl-module

DESCRIPTION="Support for the SSH 2 protocol via libssh2."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl
	net-libs/libssh2
	sys-libs/zlib"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-ParseXS"

mydoc="example/read.pl"
