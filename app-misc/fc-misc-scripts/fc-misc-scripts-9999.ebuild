# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

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
	exeinto /usr/local/bin
	doexe bin/*.sh

	insinto /usr/local/etc
	doins -r etc/foss-cloud

	insinto /usr/local/lib
	doins -r lib/foss-cloud
}
