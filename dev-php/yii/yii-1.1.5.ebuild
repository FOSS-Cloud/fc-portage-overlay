# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

TAG="r2654"

DESCRIPTION="Yii Web Framework"
HOMEPAGE="http://www.yiiframework.com/"
SRC_URI="mirror://sourceforge/yii/${P}.${TAG}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/php-5.1"

S="${WORKDIR}/${P}.${TAG}"

src_install() {
	insinto /usr/share/php/yii
	doins -r framework

	dodoc CHANGELOG README UPGRADE
}
