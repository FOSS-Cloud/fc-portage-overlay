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
RDEPEND="virtual/perl-Getopt-Long
	virtual/perl-File-Path
	virtual/perl-Sys-Syslog
	dev-perl/JSON-XS
	dev-perl/Text-CSV
	dev-perl/TermReadKey
	dev-perl/Net-OpenSSH
	dev-perl/NetAddr-IP
	dev-perl/Config-IniFiles
	net-nds/sst-ldap-utils"

src_install() {
	insinto /etc
	doins -r etc/foss-cloud

	exeinto /usr/libexec/foss-cloud
	doexe bin/node-integration-*

	dosbin bin/fc-*

	insinto /etc/openldap
	doins -r data

	dodoc README.md
}
