# Copyright 2008-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MAKAMAKA
MODULE_VERSION=0.10
inherit perl-module

DESCRIPTION="Encoding aware Text::CSV"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="test"

RDEPEND=">=dev-perl/Text-CSV-1.210.0"
DEPEND="${RDEPEND}
	test? ( perl-core/Test-Harness
		dev-perl/Test-Pod )"

SRC_TEST=do
