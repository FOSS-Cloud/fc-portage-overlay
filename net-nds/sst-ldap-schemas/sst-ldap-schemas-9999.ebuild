#
# Copyright (C) 2013 FOSS-Group
#                    Germany
#                    http://www.foss-group.de
#                    support@foss-group.de
#
# Authors:
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="FOSS-Group LDAP schemas"
HOMEPAGE="http://www.foss-group.ch/"
EGIT_REPO_URI="https://github.com/foss-cloud/ldap.git"

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
