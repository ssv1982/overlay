# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit versionator
DESCRIPTION="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"

HOMEPAGE=http://www.geogebra.org/

SLOT="0"

KEYWORDS="x86 amd64"

MY_PV=$(replace_version_separator 4 '-')

SRC_URI="amd64? ( http://www.geogebra.net/linux/pool/main/g/geogebra5/geogebra5_${MY_PV}_amd64.deb )
		 x86?	( http://www.geogebra.net/linux/pool/main/g/geogebra5/geogebra5_${MY_PV}_i386.deb ) "

S=${WORKDIR}


src_prepare() {

	bsdtar -xvf "data.tar.xz"
	rm -f "data.tar.xz"
	rm -f "control.tar.gz"
	rm -f "debian-binary"
}



src_install(){
  cp -R "${S}/usr" "${D}/usr" || die "Install failed!"
}

