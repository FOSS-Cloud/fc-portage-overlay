# Copyright 1999-2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PN="syslog-ng"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="FOSS-Group syslog-ng configuration"
HOMEPAGE="http://www.foss-cloud.de/"
SRC_URI="http://github.com/foss-cloud/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="app-admin/syslog-ng"

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /etc/syslog-ng
	doins -r *

	keepdir /var/log/syslog
}