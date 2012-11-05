# Copyright 1999-2012 FOSS-Cloud, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="FOSS-Cloud node integration scripts"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/node-integration.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

# TODO:
# - write down correct dependencies
# - move this stuff away from /usr/local
# - write a Makefile

src_install() {
	insinto /usr/local/etc
	doins -r etc/foss-cloud

	exeinto /usr/local/bin
	doexe bin/*

	insinto /etc/openldap
	doins -r data

	dodoc README.md
}
