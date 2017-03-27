# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Google Authentiator PAM plugin"
HOMEPAGE="https://github.com/google/google-authenticator-libpam/"
EGIT_REPO_URI="https://github.com/google/google-authenticator-libpam.git"

#LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

src_prepare() {

cd ${S}/libpam
sh bootstrap.sh
}

src_configure() {
cd ${S}/libpam
econf --prefix=/usr --libdir=/lib
}

src_compile() {
cd ${S}/libpam
emake
}

src_install() {
cd ${S}/libpam
emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "For setup information check the installed README"
}
