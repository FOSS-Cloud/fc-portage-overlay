# Copyright 1999-2012 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="stepping stone GmbH LDAP schemas"
HOMEPAGE="http://www.stepping-stone.ch/"
EGIT_REPO_URI="https://github.com/stepping-stone/ldap-schemas.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="net-nds/openldap"

src_install() {
	insinto /etc/openldap/schema/
	doins sst.schema

	dodoc README.md
}
