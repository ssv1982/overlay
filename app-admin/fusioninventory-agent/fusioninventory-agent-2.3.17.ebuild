EAPI=5

inherit perl-module 

MY_PN="FusionInventory-Agent" 
DESCRIPTION="Powerful inventory and package deployment system" 
HOMEPAGE="http://www.fusioninventory.org/" 
SRC_URI="http://forge.fusioninventory.org/attachments/download/1883/FusionInventory-Agent-${PV}.tar.gz" 


LICENSE="GPL-2" 
SLOT="0" 
KEYWORDS="x86 amd64" 
IUSE="+netdiscovery +daemon"

DEPEND="
        dev-lang/perl[ithreads]
        sys-apps/dmidecode 
        dev-perl/File-Which 
        dev-perl/IO-Socket-SSL 
        dev-perl/Net-IP
        dev-perl/UNIVERSAL-require 
        dev-perl/XML-TreePP 
        dev-perl/libwww-perl
        dev-perl/Config-Tiny
        dev-perl/text-template
        netdiscovery? (
    	    virtual/perl-Thread-Queue
    	    dev-perl/Net-SNMP
        )
        daemon? (
        	dev-perl/Proc-Daemon
        )
" 
RDEPEND="${DEPEND}" 

MY_P=${MY_PN}-${PV} 
S=${WORKDIR}/${MY_P} 
myconf="SYSCONFDIR=/etc/fusioninventory" 

src_install() { 
        emake install 
        dodir /usr/var/fusioninventory/ 
} 

pkg_postinst() { 
        elog "To configure Fusioninventory-agent," 
        elog "edit the file /etc/fusioninventory/agent.cfg," 
        elog "read the following web page:" 
        elog "http://www.fusioninventory.org/documentation/agent/configuration/" 
} 