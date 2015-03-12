# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/tinyxml/tinyxml-2.6.2-r2.ebuild,v 1.6 2012/07/29 16:09:01 armin76 Exp $

EAPI=4
inherit flag-o-matic toolchain-funcs eutils multilib

DESCRIPTION="a simple, small, C++ XML parser that can be easily integrating into other programs"
LOT="0"
KEYWORDS="amd64 ~arm ~ia64 ppc ~ppc64 sparc x86 ~x64-macos ~x86-macos"

SLOT="0"

RDEPEND="dev-libs/tinyxml"

