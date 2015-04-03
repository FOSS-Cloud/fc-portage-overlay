# Copyright 2008-2015=5 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module git-2

DESCRIPTION="FOSS-Cloud Backup script (a module of the stepping-stone provisioning daemon)."
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/prov-backup-kvm.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="=sys-apps/sst-provisioning-9999
	dev-perl/Config-IniFiles
	dev-perl/perl-ldap
	virtual/perl-Switch
	dev-perl/Sys-Virt
	dev-perl/XML-Simple
	dev-perl/Filesys-Df
	virtual/perl-File-Path"

src_install() {
	insinto ${VENDOR_LIB}
	doins -r lib/Provisioning

	insopts -m0640
	insinto /etc
	doins -r etc/Provisioning

	dodoc README.md
}
