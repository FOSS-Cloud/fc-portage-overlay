# Copyright 1999-2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4


DESCRIPTION="FOSS-Group syslog-ng configuration"
HOMEPAGE="http://www.foss-cloud.de/"
SRC_URI="http://github.com/foss-cloud/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="app-admin/syslog-ng"


src_install() {
	insinto /etc/syslog-ng
	doins -r *

	keepdir /var/log/syslog
}
