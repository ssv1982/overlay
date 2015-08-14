# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils pam toolchain-funcs

DESCRIPTION="Google Authentiator PAM plugin"
HOMEPAGE="http://code.google.com/p/google-authenticator/"
SRC_URI="http://google-authenticator.googlecode.com/files/${P}-source.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/allow_time_config.patch"
}

src_compile() {
	emake CC=$(tc-getCC)
}

src_install() {
	insinto $(getpam_mod_dir)
	doins pam_google_authenticator.so
	dobin google-authenticator

	dodoc README
}

pkg_postinst() {
	elog "For setup information check the installed README"
}
