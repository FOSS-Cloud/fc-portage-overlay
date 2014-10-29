# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FOSS-Cloud for schools"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${PN#fc-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/foss-cloud-1.3.0
	>=net-nds/sst-ldap-utils-1.0.5"

#S="${WORKDIR}/${P#fc-}"

src_install() {
	insinto /var/www/localhost/htdocs/vm-manager/protected
	doins -r vm-manager/protected

	insinto /etc/dhcp
	doins -r system/usr/sbin 

	dodoc README.md
}
