# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DBD-mysql/DBD-mysql-4.20.0.ebuild,v 1.11 2013/09/05 05:49:04 vapier Exp $

EAPI=4
#http://search.cpan.org/src/MJEVANS/DBD-ODBC-1.43/ODBC.pm
MODULE_AUTHOR=MJEVANS
MODULE_VERSION=1.43
inherit eutils perl-module

DESCRIPTION="The Perl DBD:ODBC Module"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="embedded"

RDEPEND="dev-perl/DBI"
DEPEND="${RDEPEND}"

mydoc="ToDo"

src_configure() {
	perl-module_src_configure
}
