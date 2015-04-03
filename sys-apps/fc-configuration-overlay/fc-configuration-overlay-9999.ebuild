# Copyright 2008-2015 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="FOSS-Cloud configuration files"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/configuration-overlay.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="app-admin/logrotate
	app-admin/syslog-ng
	app-admin/webapp-config
	app-emulation/libvirt
	dev-lang/php
	net-dns/pdns-recursor
	net-misc/dhcp
	net-misc/ntp
	net-misc/openssh
	net-nds/openldap
	sys-apps/baselayout
	sys-apps/openrc
	sys-apps/portage
	sys-apps/sysvinit
	sys-libs/glibc
	www-servers/apache"

src_install() {
	doconfd conf.d/{hwclock,keymaps,net,apache2,libvirtd}
	doinitd init.d/{dhcpd,slapd}
	doenvd env.d/02locale env.d/99editor

	keepdir /etc/config-archive

	# no recursive install on purpose
	insinto /etc
	doins *

	# do not install /etc/libvirt/qemu/networks/default.xml on purpose since we
	# don't want the default libvirt network and we keep it for blanking it out
	insinto /etc/libvirt
	doins libvirt/*
	insinto /etc/libvirt/storage
	doins libvirt/storage/*.xml

	for d in portage profile.d ssh syslog-ng dhcp kernels apache2 openldap foss-cloud php powerdns vhosts ; do
		insinto "/etc/${d}"
		doins -r "${d}"/*
	done

	fperms 0640 /etc/openldap/slapd.conf
	fowners root:ldap /etc/openldap/slapd.conf

	keepdir /var/log/syslog
	keepdir /var/virtualization
}
