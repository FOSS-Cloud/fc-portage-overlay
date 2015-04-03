# Copyright 2008-2015=5 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit mount-boot git-2

DESCRIPTION="FOSS-Cloud Artwork (Grub Splash Screen, etc.)"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/artwork.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	insinto /boot/grub
	doins grub/images/*.xpm.gz
}
