# Copyright 1999-2013 FOSS-Group
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Broker Daemon for FOSS-Cloud"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/FOSS-Cloud/${PN#fc-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/boost
	app-emulation/libvirt
	net-nds/openldap[cxx]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P#fc-}"

pkg_setup() {
	enewgroup fc-broker
	enewuser fc-broker -1 -1 /dev/null fc-broker
}

src_configure() {
	sed -i \
		-e "s|-O0 -g3|${CXXFLAGS}|" \
		Debug/subdir.mk || die "sed failed"
	sed -i \
		-e "s|-L/usr/lib|${LDFLAGS}|" \
		Debug/makefile || die "sed failed"
}

src_compile() {
	emake -C Debug/
}

src_install() {
	newsbin Debug/daemonR fc-brokerd

	insinto /etc/foss-cloud
	doins config/broker.conf
	fowners root:fc-broker /etc/foss-cloud/broker.conf
	fperms 0640 /etc/foss-cloud/broker.conf

	newinitd "${FILESDIR}/fc-brokerd.initd" "fc-brokerd"
	newconfd "${FILESDIR}/fc-brokerd.confd" "fc-brokerd"
}
