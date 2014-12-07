#
# Copyright (C) 2014 FOSS-Group
#                    Germany
#                    http://www.foss-group.de
#                    support@foss-group.de
#
# Authors:
# Beat Stebler <beat.stebler@foss-group.ch>
#  
# Licensed under the EUPL, Version 1.1 or - soon they
# will be approved by the European Commission - subsequent
# versions of the EUPL (the "Licence"); You may not use this
# work except in compliance with the Licence.
# 
# You may obtain a copy of the Licence at:
# https://joinup.ec.europa.eu/software/page/eupl
#
# Unless required by applicable law or agreed to in
# writing, software distributed under the Licence is
# distributed on an "AS IS" basis,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied.
# See the Licence for the specific language governing
# permissions and limitations under the Licence.
#
#
# $Header: $

EAPI=4

FC_BUILD_TYP=$(cat /etc/foss-cloud/fc-build-typ)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)

DESCRIPTION="FOSS-Cloud LDAP schemas"
HOMEPAGE="http://www.FOSS-Group.ch/"
SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYP}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="net-nds/openldap"

S="${WORKDIR}/${P}"

src_install() {
	insinto /etc/openldap/schema/
	doins sst.schema

	dodoc README.md
}
