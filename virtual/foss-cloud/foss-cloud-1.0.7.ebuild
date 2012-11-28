# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="virtual package to pull in FOSS-Cloud packages"
HOMEPAGE="http://www.foss-cloud.org/"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ipmi +zabbix"

DEPEND=""
RDEPEND="ipmi? ( sys-apps/ipmitool )
	zabbix? ( net-analyzer/zabbix[agent] )
	~app-misc/fc-misc-scripts-1.0.4
	~net-nds/sst-ldap-schemas-1.0.4
	~sys-apps/fc-node-integration-1.0.5
	~x11-themes/fc-artwork-1.0.4
	~www-apps/vm-manager-1.0.5
	~sys-apps/fc-configuration-1.0.4
	~sys-kernel/foss-cloud-bin-3.2.1.2
	~app-emulation/fc-broker-daemon-1.0.5"

S="${WORKDIR}"

src_compile() {
	echo "${PV}" > "foss-cloud_version"

	cat > "os-release" << EOF
NAME=FOSS-Cloud
VERSION="${PV}"
ID=foss-cloud
EOF

	echo 'CONFIG_PROTECT_MASK="/etc/os-release /etc/foss-cloud_version"' > 99foss-cloud
}

src_install() {
	insinto /etc
	doins foss-cloud_version os-release

	doenvd 99foss-cloud
}
