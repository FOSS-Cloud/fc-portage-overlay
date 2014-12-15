# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

FC_BUILD_TYP=$(cat /etc/foss-cloud/fc-build-typee)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Cloud for schools"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/pre-releases/1.3/distfiles/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=net-nds/sst-ldap-utils-1.0.5"

src_configure() {
    rm /var/www/localhost/htdocs/vm-manager/protected/config/modules_config.php
}

src_install() {
	insinto /var/www/localhost/htdocs/vm-manager/
	doins -r vm-manager/protected/

	insinto /usr/sbin/
	doins -r system/usr/sbin 

	dodoc README.md
}
