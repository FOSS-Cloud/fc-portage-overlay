# Copyright 2008-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=SALVA
MODULE_VERSION=0.52
inherit perl-module

DESCRIPTION="Perl SSH client package implemented on top of OpenSSH."

SLOT="0"
KEYWORDS="~alpha ~amd64 ~mips ~ppc ~sparc ~x86"
IUSE=""

DEPEND="net-misc/openssh
	dev-perl/IO-Tty"
RDEPEND="${DEPEND}"
