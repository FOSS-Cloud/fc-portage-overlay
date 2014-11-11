# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FOSS-Cloud Webinterface"
HOMEPAGE="http://www.foss-cloud.org/"
#SRC_URI="${FOSS_CLOUD_DOWNLOAD_URI}${FOSS_CLOUD_TYP}${FOSS_CLOUD_MAIN_RELEASE}${FOSS_CLOUD_DISTFILES}${PN}${FOSS_CLOUD_ARCHIVE}${PVR}.tar.gz -> ${P}.tar.gz"
SRC_URI="http://github.com/FOSS-Cloud/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"


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

	declare -A parameter

	parameter[server]="'ldaps://<FOSS-CLOUD-LDAP-HOSTNAME>/'"
	parameter[bind_rdn]="'cn=Manager,dc=foss-cloud,dc=org'"
	parameter[bind_pwd]="'<FOSS-CLOUD-LDAP-PASSWORD>'"
	parameter[base_dn]="'dc=foss-cloud,dc=org'"
	parameter[isochoosabledir]="'/var/virtualization/iso-choosable/'"
	parameter[isodir]="'/var/virtualization/iso/'"
	parameter[dynamicdir]="'/var/virtualization/vm-dynamic/'"
	parameter[persistentdir]="'/var/virtualization/vm-persistent/'"
	parameter[templatesdir]="'/var/virtualization/vm-templates/'"
	parameter[vmstoragepool]="'0f83f084-8080-413e-b558-b678e504836e'"
	parameter[vmtemplatestoragepool]="'5b77d2f6-061f-410c-8ee7-9e61da6f1927'"

	for k in ${!parameter[@]} ; do
		sed -i \
			-e "s|\('${k}' =>\) '.*'|\1 ${parameter[${k}]}|" \
			vm_config.php || die "sed failed for ${k}"
	done

	sed -i \
		-e "s|\('port' =>\) [0-9]*|\1 636|" \
		vm_config.php || die "sed failed"
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
