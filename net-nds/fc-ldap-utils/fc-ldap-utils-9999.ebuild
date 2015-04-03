#
# Copyright (C) 2013 FOSS-Group
#                    Germany
#                    http://www.foss-group.de
#                    support@foss-group.de
#
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="FOSS-Group LDAP utilities"
HOMEPAGE="http://www.foss-group.ch.ch/"
EGIT_REPO_URI="https://github.com/foss-cloud/ldap-utils.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="net-nds/openldap"

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
