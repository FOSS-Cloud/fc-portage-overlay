# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FOSS-Cloud for schools"
HOMEPAGE="http://www.foss-cloud.org/"
# SRC_URI="${FOSS_CLOUD_DOWNLOAD_URI}${FOSS_CLOUD_TYP}${FOSS_CLOUD_MAIN_RELEASE}${FOSS_CLOUD_DISTFILES}${PN}-${PVR}.tar.gz -> ${P}.tar.gz"
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
