# Copyright 1999-2012 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit webapp git-2

DESCRIPTION="FOSS-Cloud Webinterface"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/FOSS-Cloud/vm-manager.git"

LICENSE="EUPL"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="virtual/httpd-php
	dev-lang/php:5.3
	dev-php/pecl-uuid
	dev-php/libvirt-php
	dev-php/pecl-uploadprogress
	dev-php/pecl-ssh2
	=dev-php/yii-1.1.5"

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
	webapp_src_preinst

	dodoc README.md
	rm -f .gitignore framework.zip 
	
	insinto "${MY_HTDOCSDIR}"
    doins -r .

    webapp_configfile "${MY_HTDOCSDIR}/vm_config.php"
	webapp_serverowned -R "${MY_HTDOCSDIR}/assets"
	webapp_serverowned -R "${MY_HTDOCSDIR}/images/uploads"
	webapp_serverowned -R "${MY_HTDOCSDIR}/protected/runtime"

    webapp_src_install
}
