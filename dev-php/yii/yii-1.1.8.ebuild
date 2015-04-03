# Copyright 2008-2015 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Yii Web Framework"
HOMEPAGE="http://www.yiiframework.com/"
SRC_URI="http://github.com/yiisoft/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/php-5.4"

src_install() {
	insinto /usr/share/php/yii
	doins -r framework

	dodoc CHANGELOG README UPGRADE
}
