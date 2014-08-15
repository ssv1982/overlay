# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils versionator

DESCRIPTION="Kerio VPN Client"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://www.kerio.com/"


MY_PV=$(replace_version_separator 3 -)
#MY_PV=${MY_PV/_p/\.T}

SRC_URI="http://eu.download.kerio.com/dwn/control/control-${MY_PV}/kerio-control-vpnclient-${MY_PV}-p1-linux.deb"

LICENSE="custom:kerio-control-vpnclient"

SLOT="0"

KEYWORDS="x86 amd64"

S=${WORKDIR}

RDEPEND="dev-util/dialog"

src_prepare() {

    bsdtar -xvf "data.tar.gz"
    rm -f "data.tar.gz"
    rm -f "control.tar.gz"
    rm -f "debian-binary"
}

src_install()
{
#doinitd "./etc/init.d/kerio-kvc"

doinitd "${FILESDIR}/kerio-control-vpnclient"


dosbin "./usr/sbin/kvpncsvc"

doconfd "${FILESDIR}/conf.d/kerio-control-vpnclient"


dolib.so  "./usr/lib/libktcrypto.so.0.9.8"
dolib.so "./usr/lib/libktssl.so.0.9.8"
dolib.so "./usr/lib/libktz.so.1"
dolib.so "./usr/lib/libkvnet.so"

insinto "/var/lib/kerio-control-vpnclient"
insopts -m744
doins "${FILESDIR}/kvpnc_conf"



}


pkg_postinst() {
    elog "You will need to set up your /etc/kerio-kvc.conf file before"
    elog "running kerio-control-vpnclient  for the first time. For set up  please run:"
    elog "/var/lib/kerio-control-vpnclient/kvpnc_conf configure"
}