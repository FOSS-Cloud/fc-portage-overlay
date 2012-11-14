# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="virtual package to pull in FOSS-Cloud packages"
HOMEPAGE="http://www.foss-cloud.org/"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="=app-misc/fc-misc-scripts-1.0.4
	=net-nds/sst-ldap-schemas-1.0.4
	=sys-apps/fc-node-integration-1.0.4
	=x11-themes/fc-artwork-1.0.4
	=www-apps/vm-manager-1.0.4"

src_compile() {
	echo "${PV}" > "foss-cloud_version"

	cat > "os-release" << EOF
NAME=FOSS-Cloud
VERSION="${PV}"
ID=foss-cloud
EOF

}

src_install() {
	insinto /etc
	doins foss-cloud_version os-release
}
