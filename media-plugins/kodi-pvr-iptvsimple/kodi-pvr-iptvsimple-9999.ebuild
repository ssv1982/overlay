# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xbmc-addon-xvdr/xbmc-addon-xvdr-9999.ebuild,v 1.3 2014/01/23 10:34:05 hd_brummy Exp $

EAPI="4"

inherit git-2 autotools multilib

EGIT_REPO_URI="https://github.com/kodi-pvr/pvr.iptvsimple.git"
DESCRIPTION="Kodi's IPTV Simple client addon"
HOMEPAGE="https://github.com/afedchin/xbmc-addon-iptvsimple/wiki/IPTV-Simple-Home"
SRC_URI=""
KEYWORDS=""
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="media-plugins/kodi-platform
		media-tv/kodi"
#RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

#src_prepare() {
#	eautoreconf
#	sh bootstrap
#}

src_configure() {
#	econf --prefix=/usr/ --enable-addons-with-dependencies\
#	--libdir=/usr/share/kodi/addons \
#	--datadir=/usr/share/kodi/addons
#	econf --enable-addons-with-dependencies
  cmake ${S}/CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr/
}

src_install() {

	emake DESTDIR="${D}" install || die "emake install failed"
	#cmake ${S} 
}

pkg_info() {
	einfo "This add-on requires the installed "media-lugins/vdr-xvdr" plugin on the VDR server."
	einfo "VDR itself dosn't need any patches or modification to use all the current features."
	einfo "IMPORTANT:"
	einfo "Please disable *all* PVR addons *before* running the XVDR addon!"
}
