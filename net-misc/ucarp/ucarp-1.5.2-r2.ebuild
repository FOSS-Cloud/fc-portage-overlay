# Copyright 2008-2015=5 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/ucarp/ucarp-1.5.2-r1.ebuild,v 1.3 2012/12/16 13:47:24 ago Exp $

EAPI="5"

inherit base

DESCRIPTION="Portable userland implementation of Common Address Redundancy Protocol (CARP)."
HOMEPAGE="http://www.ucarp.org"
SRC_URI="ftp://ftp.ucarp.org/pub/ucarp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE="nls"

RDEPEND="net-libs/libpcap"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_configure() {
	econf $(use_enable nls)
}

src_install() {
	default

	doman "${FILESDIR}"/ucarp.8

	exeinto /usr/libexec/ucarp
	doexe "${FILESDIR}"/vip-up-default.sh
	doexe "${FILESDIR}"/vip-down-default.sh

	keepdir /etc/ucarp

	newinitd "${FILESDIR}"/ucarp.initd ucarp
	newconfd "${FILESDIR}"/ucarp.confd ucarp
}

pkg_postinst() {
	elog "The provided init script needs to be configured first."
	elog "Edit /etc/conf.d/ucarp to suite your environment."
	elog "You will also have to set a shared password within /etc/ucarp/ucarp.pass"
	elog "or whatever file you have set \$UCARP_PASSFILE to."

	elog "If you need more than one instance of ucarp running, simply symlink"
	elog "the init script and create a copy of the init script configuration"
	elog "which corresponds to the name of the init script."
}
