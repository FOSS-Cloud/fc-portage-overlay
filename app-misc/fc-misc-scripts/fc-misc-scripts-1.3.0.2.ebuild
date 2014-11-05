# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FOSS-Cloud miscellaneous scripts"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${PN#fc-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${P#fc-}"

src_install() {
	exeinto /usr/libexec/foss-cloud
	doexe usr/libexec/foss-cloud/*.sh

	insinto /etc
	doins -r etc/{foss-cloud,local.d}

	exeinto /etc/portage/postsync.d
	doexe etc/portage/postsync.d/sync-overlays

	insinto /usr/share
	doins -r usr/share/foss-cloud
}
