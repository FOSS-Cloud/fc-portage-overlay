# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit mount-boot versionator

MY_P="foss-cloud-${PV}"

G_REV="$(get_version_component_range 4)"
SUFFIX="x86_64-$(get_version_component_range 1-3)-gentoo${G_REV:+-r${G_REV}}"

DESCRIPTION="FOSS-Cloud kernel, modules and initramfs binaries."
HOMEPAGE="http://foss-cloud.org/"
SRC_URI="http://packages.foss-cloud.org/distfiles/foss-cloud-kernel-${PVR}.tbz2
	http://packages.foss-cloud.org/distfiles/foss-cloud-modules-${PVR}.tbz2"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /boot
	for i in config initramfs kernel System.map ; do
		newins "${i}-"* "${i}-foss-cloud-${SUFFIX}"
	done

	insinto /lib
	doins -r lib/modules 
}

pkg_postinst() {
	rm -f /boot/{initramfs,kernel,System.map,config}.old

	for f in initramfs kernel System.map config ; do
		[ -h "/boot/${f}" ] && mv "/boot/${f}" "/boot/${f}.old"
		ln -sf "${f}-foss-cloud-${SUFFIX}" /boot/${f}
	done

	mount-boot_pkg_postinst
}
