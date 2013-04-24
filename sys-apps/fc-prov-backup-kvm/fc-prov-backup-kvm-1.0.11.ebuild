# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils perl-module

DESCRIPTION="FOSS-Cloud Backup script (a module of the stepping-stone provisioning daemon)."
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${PN#fc-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="~sys-apps/sst-provisioning-0.2.4
	dev-perl/Config-IniFiles
	dev-perl/perl-ldap
	virtual/perl-Switch
	dev-perl/Sys-Virt
	dev-perl/XML-Simple
	dev-perl/Filesys-Df
	virtual/perl-File-Path"

S="${WORKDIR}/${P#fc-}"

src_install() {
	insinto ${VENDOR_LIB}
	doins -r lib/Provisioning

	insopts -m0640
	insinto /etc
	doins -r etc/Provisioning

	dodoc README.md

	newconfd "${FILESDIR}/prov-backup-kvm.confd" prov-backup-kvm
	newinitd "${FILESDIR}/prov-backup-kvm.initd" prov-backup-kvm
}
