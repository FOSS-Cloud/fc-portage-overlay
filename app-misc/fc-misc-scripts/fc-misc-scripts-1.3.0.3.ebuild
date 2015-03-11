# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

FC_BUILD_TYP=$(cat /etc/foss-cloud/fc-build-type)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Cloud miscellaneous scripts"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYP}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""


src_install() {
	exeinto /usr/libexec/foss-cloud
	doexe usr/libexec/foss-cloud/*.sh

	insinto /etc
	doins -r etc/{foss-cloud,local.d}

	exeinto /etc/portage/postsync.d
	doexe etc/portage/postsync.d/sync-overlays

	insinto /usr/share
	doins -r usr/share/foss-cloud

    dosbin -r  usr/sbin/*
}
