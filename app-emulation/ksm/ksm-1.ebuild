# Copyright 2008-2015=5 FOSS-Group
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Kernel Samepage Merging (KSM) initscripts and ksmtuned daemon from Fedora."
HOMEPAGE="http://fedoraproject.org/wiki/Features/KSM"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${FILESDIR}"

src_install() {
	newconfd ksm.confd ksm
	newinitd ksm.initd ksm
	newinitd ksmtuned.initd ksmtuned
	dosbin ksmtuned
	insinto /etc
	doins ksmtuned.conf
}
