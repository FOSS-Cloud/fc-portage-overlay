# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit mount-boot

DESCRIPTION="FOSS-Cloud Artwork (Grub Splash Screen, etc.)"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""


src_install() {
	insinto /boot/grub
	doins grub/images/*.xpm.gz
}
