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

KEYWORDS="x86 amd64"

RDEPEND=">=virtual/jre-1.6.0"
MY_PV=$(replace_version_separator 3 '-')

SRC_URI="http://download.geogebra.org/installers/4.4/GeoGebra-Linux-Installer-${PV}.tar.gz"

src_install(){
    diropts -m755 
    dodir /usr/share/icons/hicolor/16x16/apps
    dodir /usr/share/icons/hicolor/22x22/apps
    dodir /usr/share/icons/hicolor/24x24/apps
    dodir /usr/share/icons/hicolor/32x32/apps
    dodir /usr/share/icons/hicolor/36x36/apps
    dodir /usr/share/icons/hicolor/48x48/apps
    dodir /usr/share/icons/hicolor/64x64/apps
    dodir /usr/share/icons/hicolor/72x72/apps
    dodir /usr/share/icons/hicolor/96x96/apps
    dodir /usr/share/icons/hicolor/128x128/apps
    dodir /usr/share/icons/hicolor/192x192/apps
    dodir /usr/share/icons/hicolor/256x256/apps
    dodir /usr/share/icons/hicolor/scalable/apps

    dodir /usr/share/icons/hicolor/16x16/mimetypes
    dodir /usr/share/icons/hicolor/22x22/mimetypes
    dodir /usr/share/icons/hicolor/24x24/mimetypes
    dodir /usr/share/icons/hicolor/32x32/mimetypes
    dodir /usr/share/icons/hicolor/36x36/mimetypes
    dodir /usr/share/icons/hicolor/48x48/mimetypes
    dodir /usr/share/icons/hicolor/64x64/mimetypes
    dodir /usr/share/icons/hicolor/72x72/mimetypes
    dodir /usr/share/icons/hicolor/96x96/mimetypes
    dodir /usr/share/icons/hicolor/128x128/mimetypes
    dodir /usr/share/icons/hicolor/192x192/mimetypes
    dodir /usr/share/icons/hicolor/256x256/mimetypes
    dodir /usr/share/icons/hicolor/scalable/mimetypes
    
    
    insopts -m644
    insinto /usr/share/geogebra
    doins *.jar
    
#    ./install-sh -m 755 geogebra /usr/bin
    into /usr
    dobin geogebra

#    ./install-sh -m 644 geogebra.xml /usr/share/mime/packages
    insopts -m644
    insinto /usr/share/mime/packages
    doins geogebra.xml

#    ./install-sh -m 644 geogebra.desktop /usr/share/applications
    insopts -m644
    
    
    #./install-sh -m 644 icons/hicolor/16x16/apps/geogebra.png /usr/share/icons/hicolor/16x16/apps
    insinto /usr/share/icons/hicolor/16x16/apps
    doins icons/hicolor/16x16/apps/geogebra.png

    #./install-sh -m 644 icons/hicolor/22x22/apps/geogebra.png /usr/share/icons/hicolor/22x22/apps
    insinto /usr/share/icons/hicolor/22x22/apps
    doins icons/hicolor/22x22/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/24x24/apps/geogebra.png /usr/share/icons/hicolor/24x24/apps
    insinto /usr/share/icons/hicolor/24x24/apps
    doins icons/hicolor/24x24/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/32x32/apps/geogebra.png /usr/share/icons/hicolor/32x32/apps
    insinto /usr/share/icons/hicolor/32x32/apps
    doins icons/hicolor/32x32/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/36x36/apps/geogebra.png /usr/share/icons/hicolor/36x36/apps
    insinto /usr/share/icons/hicolor/36x36/apps
    doins icons/hicolor/36x36/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/48x48/apps/geogebra.png /usr/share/icons/hicolor/48x48/apps
    insinto /usr/share/icons/hicolor/48x48/apps
    doins icons/hicolor/48x48/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/64x64/apps/geogebra.png /usr/share/icons/hicolor/64x64/apps
    insinto /usr/share/icons/hicolor/64x64/apps
    doins icons/hicolor/64x64/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/72x72/apps/geogebra.png /usr/share/icons/hicolor/72x72/apps
    insinto /usr/share/icons/hicolor/72x72/apps
    doins icons/hicolor/72x72/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/96x96/apps/geogebra.png /usr/share/icons/hicolor/96x96/apps
    insinto /usr/share/icons/hicolor/96x96/apps
    doins icons/hicolor/96x96/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/128x128/apps/geogebra.png /usr/share/icons/hicolor/128x128/apps
    insinto /usr/share/icons/hicolor/128x128/apps
    doins icons/hicolor/128x128/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/192x192/apps/geogebra.png /usr/share/icons/hicolor/192x192/apps
    insinto /usr/share/icons/hicolor/192x192/apps
    doins icons/hicolor/192x192/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/256x256/apps/geogebra.png /usr/share/icons/hicolor/256x256/apps
    insinto /usr/share/icons/hicolor/256x256/apps
    doins icons/hicolor/256x256/apps/geogebra.png
    #./install-sh -m 644 icons/hicolor/scalable/apps/geogebra.svgz /usr/share/icons/hicolor/scalable/apps
    insinto /usr/share/icons/hicolor/scalable/apps
    doins icons/hicolor/scalable/apps/geogebra.svgz

    #./install-sh -m 644 icons/hicolor/16x16/mimetypes/*.* /usr/share/icons/hicolor/16x16/mimetypes
    insinto /usr/share/icons/hicolor/16x16/mimetypes
    doins icons/hicolor/16x16/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/22x22/mimetypes/*.* /usr/share/icons/hicolor/22x22/mimetypes
    insinto /usr/share/icons/hicolor/22x22/mimetypes
    doins icons/hicolor/22x22/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/24x24/mimetypes/*.* /usr/share/icons/hicolor/24x24/mimetypes
    insinto /usr/share/icons/hicolor/24x24/mimetypes
    doins icons/hicolor/24x24/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/32x32/mimetypes/*.* /usr/share/icons/hicolor/32x32/mimetypes
    insinto /usr/share/icons/hicolor/32x32/mimetypes
    doins icons/hicolor/32x32/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/36x36/mimetypes/*.* /usr/share/icons/hicolor/36x36/mimetypes
    insinto /usr/share/icons/hicolor/36x36/mimetypes
    doins icons/hicolor/36x36/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/48x48/mimetypes/*.* /usr/share/icons/hicolor/48x48/mimetypes
    insinto /usr/share/icons/hicolor/48x48/mimetypes
    doins icons/hicolor/48x48/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/64x64/mimetypes/*.* /usr/share/icons/hicolor/64x64/mimetypes
    insinto /usr/share/icons/hicolor/64x64/mimetypes
    doins icons/hicolor/64x64/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/72x72/mimetypes/*.* /usr/share/icons/hicolor/72x72/mimetypes
    insinto /usr/share/icons/hicolor/72x72/mimetypes
    doins icons/hicolor/72x72/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/96x96/mimetypes/*.* /usr/share/icons/hicolor/96x96/mimetypes
    insinto /usr/share/icons/hicolor/96x96/mimetypes
    doins icons/hicolor/96x96/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/128x128/mimetypes/*.* /usr/share/icons/hicolor/128x128/mimetypes
    insinto /usr/share/icons/hicolor/128x128/mimetypes
    doins icons/hicolor/128x128/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/192x192/mimetypes/*.* /usr/share/icons/hicolor/192x192/mimetypes
    insinto /usr/share/icons/hicolor/192x192/mimetypes
    doins icons/hicolor/192x192/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/256x256/mimetypes/*.* /usr/share/icons/hicolor/256x256/mimetypes
    insinto /usr/share/icons/hicolor/256x256/mimetypes
    doins icons/hicolor/256x256/mimetypes/*.*
    #./install-sh -m 644 icons/hicolor/scalable/mimetypes/*.* /usr/share/icons/hicolor/scalable/mimetypes
    insinto /usr/share/icons/hicolor/scalable/mimetypes
    doins icons/hicolor/scalable/mimetypes/*.*
    
#    domenu ${FILESDIR}/geogebra.desktop
    domenu geogebra.desktop
}