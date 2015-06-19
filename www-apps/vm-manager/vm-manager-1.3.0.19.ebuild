# Copyright 2008-2015 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FC_BUILD_TYPE=$(cat /etc/foss-cloud/fc-build-type)
FC_BUILD_VERSION=$(cat /etc/foss-cloud/fc-build-version)


DESCRIPTION="FOSS-Cloud Webinterface"
HOMEPAGE="http://www.foss-cloud.org/"

SRC_URI="https://packages.foss-cloud.org/foss-cloud/${FC_BUILD_TYPE}/${FC_BUILD_VERSION}/distfiles/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="virtual/httpd-php
	dev-lang/php:5.4
	dev-php/pecl-uuid
	dev-php/libvirt-php
	dev-php/pecl-uploadprogress
	dev-php/pecl-ssh2
	=dev-php/yii-1.1.8"

src_configure() {
	sed -i \
		-e "s|^\$yii=.*|\$yii='/usr/share/php/yii/framework/yii.php';|" \
		index.php || die "sed failed"
}

src_install() {
	dodoc README.md
	rm -rf .gitignore .git framework.zip 
	
	insinto "/var/www/localhost/htdocs/vm-manager"
    doins -r .

	fperms 640 "/var/www/localhost/htdocs/vm-manager/vm_config.php"
	fowners root:apache "/var/www/localhost/htdocs/vm-manager/vm_config.php"
 
	fperms 770 "/var/www/localhost/htdocs/vm-manager/assets/"
	fperms 770 "/var/www/localhost/htdocs/vm-manager/images/uploads/"
	fperms 770 "/var/www/localhost/htdocs/vm-manager/protected/runtime/"
	fowners root:apache "/var/www/localhost/htdocs/vm-manager/assets/"
	fowners root:apache "/var/www/localhost/htdocs/vm-manager/images/uploads/"
	fowners root:apache "/var/www/localhost/htdocs/vm-manager/protected/runtime/"

	echo 'CONFIG_PROTECT="/var/www/localhost/htdocs/vm-manager/vm_config.php"' > "${T}/99vm-manager"
	doenvd "${T}/99vm-manager"
}
