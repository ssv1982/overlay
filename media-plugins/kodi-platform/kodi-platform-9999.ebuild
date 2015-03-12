# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xbmc-addon-xvdr/xbmc-addon-xvdr-9999.ebuild,v 1.3 2014/01/23 10:34:05 hd_brummy Exp $

EAPI="4"

inherit git-2 autotools multilib

EGIT_REPO_URI="https://github.com/xbmc/kodi-platform.git"
DESCRIPTION="Kodi platform environment for compiling cmake binary addons"
HOMEPAGE="https://github.com/xbmc/kodi-platform"
SRC_URI=""
KEYWORDS=""
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="media-tv/kodi"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}


src_configure() {
	cmake ${S}/CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr/
}

src_install() {

	emake DESTDIR="${D}" install || die "emake install failed"
}
