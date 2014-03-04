# Copyright 1999-2013 stepping stone GmbH
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="FGA"
MODULE_VERSION=0.009

inherit perl-module

DESCRIPTION="Access the JSON-RPC API of a Zabbix server"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-perl/JSON
	dev-perl/libwww-perl
	dev-perl/Params-Validate"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build
	test? ( dev-perl/Test-Exception
		virtual/perl-File-Spec )"

SRC_TEST="do"
