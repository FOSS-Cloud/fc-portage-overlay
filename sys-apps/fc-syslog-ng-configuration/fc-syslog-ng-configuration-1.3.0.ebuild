# Copyright 2008-2015 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FC_BUILD_TYPE=$(cat /etc/foss-cloud/fc-build-type)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Group syslog-ng configuration"
HOMEPAGE="http://www.foss-cloud.de/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYPE}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

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
