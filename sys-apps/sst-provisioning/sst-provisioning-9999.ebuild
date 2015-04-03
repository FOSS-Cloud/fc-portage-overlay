# Copyright 2008-2015 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module git-2

DESCRIPTION="stepping stone GmbH Provisioning scripts"
HOMEPAGE="http://www.stepping-stone.ch/"
EGIT_REPO_URI="https://github.com/stepping-stone/Provisioning.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-perl/Config-IniFiles
	virtual/perl-Sys-Syslog
	virtual/perl-Getopt-Long
	dev-perl/LockFile-Simple
	virtual/perl-File-Path
	dev-perl/perl-ldap
	dev-perl/Net-SMTP-TLS
	dev-perl/Net-OpenSSH
	dev-perl/Text-CSV
	dev-perl/IO-String
	virtual/perl-Switch"

# TODO:
# * Crypt-GeneratePassword dependency missing for Provisioning/lib/Provisioning/Groupware/OX/OXAccount.pm

src_install() {
	insinto ${VENDOR_LIB}
	doins -r lib/Provisioning

	dobin bin/*.pl

	insopts -m0640
	insinto /etc
	doins -r etc/Provisioning

	dodoc README.md
}
