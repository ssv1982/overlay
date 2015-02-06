# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
#EAPI=1
inherit versionator
#eutils
#inherit eutils
DESCRIPTION="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE=http://www.geogebra.org/""

SLOT="0"

KEYWORDS="amd64"

#RDEPEND=">=virtual/jre-1.6.0"
MY_PV=$(replace_version_separator 4 '-')

#http://download.geogebra.org/installers/5.0/GeoGebra-Linux-Portable-5.0.61.0.tar.bz2
#http://www.geogebra.net/linux/pool/main/g/geogebra5/geogebra5_5.0.61.0-38708_amd64.deb
SRC_URI="amd64? ( http://www.geogebra.net/linux/pool/main/g/geogebra5/geogebra5_${MY_PV}_amd64.deb )
		 x86?	( http://www.geogebra.net/linux/pool/main/g/geogebra5/geogebra5_${MY_PV}_i386.deb ) "

S=${WORKDIR}


src_prepare() {

	bsdtar -xvf "data.tar.gz"
	rm -f "data.tar.gz"
	rm -f "control.tar.gz"
	rm -f "debian-binary"
}



src_install(){
  cp -R "${S}/usr" "${D}/usr" || die "Install failed!"
}

