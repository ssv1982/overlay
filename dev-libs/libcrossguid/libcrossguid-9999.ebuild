# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Lightweight cross platform C++ GUID/UUID library"
HOMEPAGE="https://github.com/graeme-hill/crossguid"
SRC_URI=""
EGIT_REPO_URI="https://github.com/graeme-hill/crossguid.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND=""

src_compile() {
    g++ -c guid.cpp -o guid.o -Wall -std=c++11 -DGUID_LIBUUID
    ar rvs libcrossguid.a guid.o
}

src_install() {
    insinto /usr/include
    doins "${S}"/guid.h || die
    dolib.a "${S}"/libcrossguid.a || die
}