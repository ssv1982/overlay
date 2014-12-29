# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="2GIS"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://2gis.ru/"


#MY_PV=$(replace_version_separator 3 -)
#MY_PV=${MY_PV/_p/\.T}

#SRC_URI="http://eu.download.kerio.com/dwn/control/control-${MY_PV}/kerio-control-vpnclient-${MY_PV}-p1-linux.deb"

SRC_URI="http://deb.2gis.ru/pool/non-free/2/2gis/2gis_4.14.11-0trusty1%2bshv121%2br169_amd64.deb"

LICENSE="custom"

SLOT="0"

KEYWORDS="x86 amd64"

S=${WORKDIR}

DEPEND="
	>=sys-libs/glibc-2.16.0 
	|| ( >=x11-libs/libGLw-7.8.1 x11-libs/libX11 )
	>=media-libs/fontconfig-2.9.0
	>=x11-libs/libICE-1.0.0
	>=dev-libs/icu-52.1
	>=media-libs/jpeg-8c
	>=media-libs/libpng-1.2.13:1.2
	x11-libs/libSM
	>=virtual/libudev-183
	x11-libs/libX11
	x11-libs/libxcb
	>=x11-libs/libXi-1.7.2
	>=dev-libs/libxml2-2.7.4
	x11-libs/libXrender
	>=dev-libs/libxslt-1.1.25
	>=sys-libs/zlib-1.2.0
    "

#Depends: libc6 (>= 2.15), 
#libcups2 (>= 1.4.0), ---------
#libegl1-mesa (>= 7.8.1) | libegl1-x11, 
#libfontconfig1 (>= 2.9.0), 
#libfreetype6 (>= 2.3.5),  -------
#libgcc1 (>= 1:4.2.1), ------
#libgl1-mesa-glx | libgl1, ------
#libglib2.0-0 (>= 2.37.3), ------------
#libgstreamer-plugins-base1.0-0 (>= 1.2.0), ----------
#libgstreamer1.0-0 (>= 1.0.0), --------------
#libice6 (>= 1:1.0.0), 
#libicu52 (>= 52~m1-1~), 
#libjpeg8 (>= 8c), 
#libpng12-0 (>= 1.2.13-4), 
#libsm6, 
#libsqlite3-0 (>= 3.5.9), ------
#libstdc++6 (>= 4.8.1), --------
#libudev1 (>= 183),
#libx11-6,
#libx11-xcb1, ---
#libxcb-glx0, ---
#libxcb-icccm4 (>= 0.4.1),---
#libxcb-image0 (>= 0.3.9),---
#libxcb-keysyms1 (>= 0.3.9), ---
#libxcb-randr0 (>= 1.3),---
#libxcb-render-util0 (>= 0.3.8),---
#libxcb-render0, --
#libxcb-shape0, ---
#libxcb-shm0, ---
#libxcb-sync1, ---
#libxcb-xfixes0, ---
#libxcb1, ---
#libxcomposite1 (>= 1:0.3-1), 
#libxi6 (>= 2:1.2.99.4), 
#libxml2 (>= 2.7.4), 
#libxrender1, 
#libxslt1.1 (>= 1.1.25), 
#zlib1g (>= 1:1.2.0)



src_prepare() {

    bsdtar -xvf "data.tar.xz"
    rm -f "data.tar.xz"
    rm -f "control.tar.gz"
    rm -f "debian-binary"
}

src_install()
{
#doinitd "./etc/init.d/kerio-kvc"

#doinitd "${FILESDIR}/kerio-control-vpnclient"


dobin "./usr/bin/2gis"

#doconfd "${FILESDIR}/conf.d/kerio-control-vpnclient"

insinto /usr/lib/2GIS/v4/

doins ./usr/lib/2GIS/v4/*

#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Bluetooth.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5CLucene.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Concurrent.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Core.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Designer.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5DesignerComponents.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Gui.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Help.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Network.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Nfc.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5OpenGL.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5PrintSupport.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Sql.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Svg.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Test.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5WebKit.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5WebKitWidgets.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5WebSockets.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Widgets.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5X11Extras.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5Xml.so.5"
#dolib.so  "./usr/lib/2GIS/v4/lib/libQt5XmlPatterns.so.5"

into /usr/lib/2GIS/v4/

dolib.so ./usr/lib/2GIS/v4/plugins/*




#insinto "/var/lib/kerio-control-vpnclient"
#insopts -m744
#doins "${FILESDIR}/kvpnc_conf"



}


#pkg_postinst() {
#    elog "You will need to set up your /etc/kerio-kvc.conf file before"
#    elog "running kerio-control-vpnclient  for the first time. For set up  please run:"
#    elog "/var/lib/kerio-control-vpnclient/kvpnc_conf configure"
#}