# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PN="fc-node-integration"
MY_P="${MY_PN}-${PV}"


DESCRIPTION="FOSS-Cloud node integration scripts"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
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
	dev-perl/Crypt-GeneratePassword
	>=net-nds/fc-ldap-utils-1.0.5"

S="${WORKDIR}/${MY_P}"

src_configure() {
	sed -i \
		-e '/^my $config_file_path/ { s|= .*;|= "/etc/foss-cloud";| }' \
		-e '/^my $helper_scripts_path/ { s|= .*;|= "/usr/libexec/foss-cloud";| }' \
		bin/fc-node-configuration || die "sed failed"
}

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
