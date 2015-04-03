# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="FOSS-Cloud miscellaneous scripts"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/misc-scripts.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	exeinto /usr/libexec/foss-cloud
	doexe usr/libexec/foss-cloud/*.sh

	insinto /etc
	doins -r etc/{foss-cloud,local.d}

	insinto /usr/share
	doins -r usr/share/foss-cloud
}
