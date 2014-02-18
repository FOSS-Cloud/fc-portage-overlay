# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="virtual package to pull in FOSS-Cloud packages"
HOMEPAGE="http://www.foss-cloud.org/"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE="+cifs +ipmi +zabbix"

DEPEND=""
RDEPEND="cifs? ( net-fs/cifs-utils )
	ipmi? ( sys-apps/ipmitool )
	zabbix? ( net-analyzer/zabbix[agent] )
	sys-block/nbd
	>=net-misc/ucarp-1.5.2-r3
	~app-misc/fc-misc-scripts-X.Y.Z
	~net-nds/sst-ldap-schemas-X.Y.Z
	~sys-apps/fc-node-integration-X.Y.Z
	~sys-apps/fc-prov-backup-kvm-X.Y.Z
	~x11-themes/fc-artwork-X.Y.Z
	~www-apps/vm-manager-X.Y.Z
	~sys-apps/fc-configuration-X.Y.Z
	~sys-kernel/foss-cloud-bin-X.Y.Z
	~app-emulation/fc-broker-daemon-X.Y.Z
"

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
