# Copyright 1999-2012 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="stepping stone GmbH LDAP utilities"
HOMEPAGE="http://www.stepping-stone.ch/"
SRC_URI="http://github.com/stepping-stone/${PN#sst-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="net-nds/openldap"

S="${WORKDIR}/${P#sst-}"

src_configure() {
	sed -i \
		-e 's|/usr/local/bin|/usr/libexec/foss-cloud|' \
		bin/restoreOpenLDAPmaster.sh || die "sed failed"
}

src_install() {
	dosbin bin/{makeOpenLDAPmasterBackup,restoreOpenLDAPmaster}.sh

	exeinto /usr/libexec/foss-cloud
	doexe bin/createDirectoryStructureDIT.sh

	dodoc README.md
}
