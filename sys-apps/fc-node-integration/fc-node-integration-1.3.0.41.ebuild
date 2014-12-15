# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FC_BUILD_TYP=$(cat /etc/foss-cloud/fc-build-type)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Cloud node integration scripts"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYP}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

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
    dosbin bin/pwfcck
	insinto /etc/openldap
	doins -r data

	dodoc README.md
}
