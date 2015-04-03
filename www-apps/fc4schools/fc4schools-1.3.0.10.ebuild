# Copyright 2008-2015 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FC_BUILD_TYPE=$(cat /etc/foss-cloud/fc-build-type)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Cloud for schools"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYPE}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=net-nds/fc-ldap-utils-1.3.0"

src_prepare() {
    rm /var/www/localhost/htdocs/vm-manager/protected/config/modules_config.php
}

src_install() {
	insinto /var/www/localhost/htdocs/vm-manager/
	doins -r vm-manager/protected/

	insinto /usr/sbin/
	doins -r system/usr/sbin/*

	dodoc README.md
}
