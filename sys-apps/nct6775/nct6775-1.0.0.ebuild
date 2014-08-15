
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/test/msvtest/msvtest-1.0.ebuild,v 1.7 2006/11/15 12:58:38 corsair Exp $

EAPI=5

DESCRIPTION="This program is simple test projects. No more."


inherit eutils linux-mod

SRC_URI="https://github.com/groeck/nct6775/archive/master.zip"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="x86 amd86"

IUSE=""


src_unpack(){
unpack master.zip
S="${WORKDIR}/${PN}-master"

BUILD_TARGETS="modules"
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="nct6775(drivers/hwmon:${S})"

#$mv -R "${WORKDIR}/${PN}-master" ${S}
}

src_prepare(){
epatch "${FILESDIR}/Makefile.patch"
}

#pkg_setup() {
#    linux-mod_pkg_setup
#    BUILD_TARGETS="default"
#    BUILD_PARAMS="KVERSION=${KV_FULL}"
#}



#src_compile() {
#cd ${S}
#econf || die "could not configure"
#emake || die "emake failed"
#linux-mod_src_compile
#${S}/make
#}

#src_install() {
#cd ${PN}
#mkdir -p ${D}/usr/bin/
#cp ./${PN} ${D}/usr/bin/
#make install
#linux-mod_src_install
#}