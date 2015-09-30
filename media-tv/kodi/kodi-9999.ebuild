# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-tv/xbmc/xbmc-9999.ebuild,v 1.164 2014/08/12 04:47:55 vapier Exp $

EAPI="5"

# Does not work with py3 here
# It might work with py:2.5 but I didn't test that
PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="sqlite"

inherit eutils python-single-r1 multiprocessing autotools

CODENAME="Helix"
EGIT_REPO_URI="git://github.com/xbmc/xbmc.git"
inherit git-2

DESCRIPTION="Kodi is a free and open source media-player and entertainment hub"
HOMEPAGE="http://kodi.tv/"

LICENSE="GPL-2"
SLOT="0"
IUSE="-airplay alsa altivec avahi bluetooth bluray caps cec css debug +fishbmc gles goom java joystick midi mysql nfs +opengl profile +projectm pulseaudio pvr +rsxs rtmp +samba +sdl sse sse2 sftp test udisks upnp upower +usb vaapi vdpau webserver +X +xrandr"
REQUIRED_USE="
	pvr? ( mysql )
	rsxs? ( X )
	X? ( sdl )
	xrandr? ( X )
"

COMMON_DEPEND="${PYTHON_DEPS}
	app-arch/bzip2
	app-arch/unzip
	app-arch/zip
	app-i18n/enca
	airplay? ( app-pda/libplist )
	dev-libs/boost
	dev-libs/fribidi
	dev-libs/libcdio[-minimal]
	cec? ( >=dev-libs/libcec-2.1 )
	dev-libs/libpcre[cxx]
	>=dev-libs/lzo-2.04
	dev-libs/tinyxml[stl]
	dev-libs/yajl
	dev-python/simplejson[${PYTHON_USEDEP}]
	media-fonts/corefonts
	media-fonts/roboto
	media-libs/alsa-lib
	media-libs/flac
	media-libs/fontconfig
	media-libs/freetype
	media-sound/dcadec
	>=media-libs/glew-1.5.6
	media-libs/jasper
	media-libs/jbigkit
	>=media-libs/libass-0.9.7
	bluray? ( media-libs/libbluray )
	css? ( media-libs/libdvdcss )
	media-libs/libmad
	media-libs/libmodplug
	media-libs/libmpeg2
	media-libs/libogg
	media-libs/libpng
	projectm? ( media-libs/libprojectm )
	media-libs/libsamplerate
	sdl? ( media-libs/libsdl[sound,opengl,video,X] )
	alsa? ( media-libs/libsdl[alsa] )
	>=media-libs/taglib-1.8
	media-libs/libvorbis
	sdl? (
		media-libs/sdl-gfx
		>=media-libs/sdl-image-1.2.10[gif,jpeg,png]
		media-libs/sdl-mixer
		media-libs/sdl-sound
	)
	media-libs/tiff
	pulseaudio? ( media-sound/pulseaudio )
	media-sound/wavpack
	|| ( >=media-video/ffmpeg-1.2.1:0=[encode] ( media-libs/libpostproc >=media-video/libav-10_alpha:=[encode] ) )
	rtmp? ( media-video/rtmpdump )
	avahi? ( net-dns/avahi )
	nfs? ( net-fs/libnfs )
	webserver? ( net-libs/libmicrohttpd[messages] )
	sftp? ( net-libs/libssh[sftp] )
	net-misc/curl
	samba? ( >=net-fs/samba-3.4.6[smbclient(+)] )
	bluetooth? ( net-wireless/bluez )
	sys-apps/dbus
	caps? ( sys-libs/libcap )
	sys-libs/zlib
	virtual/jpeg
	usb? ( virtual/libusb )
	mysql? ( virtual/mysql )
	opengl? (
		virtual/glu
		virtual/opengl
	)
	gles? (
		virtual/opengl
		media-libs/mesa[gles2]
	)
	vaapi? ( x11-libs/libva[opengl] )
	vdpau? (
		|| ( x11-libs/libvdpau >=x11-drivers/nvidia-drivers-180.51 )
		|| ( >=media-video/ffmpeg-1.2.1:0=[vdpau] >=media-video/libav-10_alpha:=[vdpau] )
	)
	X? (
		x11-apps/xdpyinfo
		x11-apps/mesa-progs
		x11-libs/libXinerama
		xrandr? ( x11-libs/libXrandr )
		x11-libs/libXrender
	)"
RDEPEND="${COMMON_DEPEND}
	udisks? ( sys-fs/udisks:0 )
	upower? ( || ( sys-power/upower sys-power/upower-pm-utils ) )"
DEPEND="${COMMON_DEPEND}
	app-arch/xz-utils
	dev-lang/swig
	dev-util/gperf
	X? ( x11-proto/xineramaproto )
	dev-util/cmake
	x86? ( dev-lang/nasm )
	java? ( virtual/jre )
	test? ( dev-cpp/gtest )"
# Force java for latest git version to avoid having to hand maintain the
# generated addons package.  #488118
[[ ${PV} == "9999" ]] && DEPEND+=" virtual/jre"

pkg_setup() {
	python-single-r1_pkg_setup

	if has_version 'media-video/libav' ; then
		ewarn "Building ${PN} against media-video/libav is not supported upstream."
		ewarn "It requires building a (small) wrapper library with some code"
		ewarn "from media-video/ffmpeg."
		ewarn "If you experience issues, please try with media-video/ffmpeg."
	fi
}

src_unpack() {
	[[ ${PV} == "9999" ]] && git-2_src_unpack || default
}

src_prepare() {
    sh bootstrap
}

src_configure() {
	# Disable documentation generation
#	export ac_cv_path_LATEX=no
	# Avoid help2man
#	export HELP2MAN=$(type -P help2man || echo true)
	# No configure flage for this #403561
#	export ac_cv_lib_bluetooth_hci_devid=$(usex bluetooth)
	# Requiring java is asine #434662
#	[[ ${PV} != "9999" ]] && export ac_cv_path_JAVA_EXE=$(which $(usex java java true))

	econf \
		--docdir=/usr/share/doc/${PF} \
		--disable-ccache \
		--disable-optimizations \
		--disable-option-checking \
#		--enable-external-libraries \
		$(has_version 'media-video/libav' && echo "--enable-libav-compat") \
		$(use_enable airplay) \
		$(use_enable avahi) \
		$(use_enable bluray libbluray) \
		$(use_enable caps libcap) \
		$(use_enable cec libcec) \
		$(use_enable css dvdcss) \
		$(use_enable debug) \
		$(use_enable fishbmc) \
		$(use_enable gles) \
		$(use_enable goom) \
#		--disable-hal \
		$(use_enable joystick) \
		$(use_enable midi mid) \
		$(use_enable mysql) \
		$(use_enable nfs) \
		$(use_enable opengl gl) \
		$(use_enable profile profiling) \
		$(use_enable projectm) \
		$(use_enable pulseaudio pulse) \
		$(use_enable pvr mythtv) \
		$(use_enable rsxs) \
		$(use_enable rtmp) \
		$(use !rtmp && echo "--enable-rtmp=no") \
		$(use_enable samba) \
		$(use_enable sdl) \
		$(use_enable sftp ssh) \
		$(use_enable usb libusb) \
		$(use_enable test gtest) \
		$(use_enable upnp) \
		$(use_enable vaapi) \
		$(use_enable vdpau) \
		$(use_enable webserver) \
		$(use_enable X x11) \
		$(use_enable xrandr)
}

src_install() {
	default
#	rm "${ED}"/usr/share/doc/*/{LICENSE.GPL,copying.txt}*

	domenu tools/Linux/kodi.desktop
	newicon media/icon48x48.png xbmc.png

	# Remove optional addons (platform specific and disabled by USE flag).
	local disabled_addons=(
		repository.pvr-{android,ios,osx{32,64},win32}.xbmc.org
		visualization.dxspectrum
	)
	use fishbmc  || disabled_addons+=( visualization.fishbmc )
	use projectm || disabled_addons+=( visualization.{milkdrop,projectm} )
	use rsxs     || disabled_addons+=( screensaver.rsxs.{euphoria,plasma,solarwinds} )
	rm -rf "${disabled_addons[@]/#/${ED}/usr/share/kodi/addons/}"

	# Punt simplejson bundle, we use the system one anyway.
#	rm -rf "${ED}"/usr/share/xbmc/addons/script.module.simplejson/lib
	# Remove fonconfig settings that are used only on MacOSX.
	# Can't be patched upstream because they just find all files and install
	# them into same structure like they have in git.
#	rm -rf "${ED}"/usr/share/xbmc/system/players/dvdplayer/etc

	# Replace bundled fonts with system ones
	# teletext.ttf: unknown
	# bold-caps.ttf: unknown
	# roboto: roboto-bold, roboto-regular
	# arial.ttf: font mashed from droid/roboto, not removed wrt bug#460514
#	rm -rf "${ED}"/usr/share/xbmc/addons/skin.confluence/fonts/Roboto-*
#	dosym /usr/share/fonts/roboto/Roboto-Regular.ttf \
#		/usr/share/xbmc/addons/skin.confluence/fonts/Roboto-Regular.ttf
#	dosym /usr/share/fonts/roboto/Roboto-Bold.ttf \
#		/usr/share/xbmc/addons/skin.confluence/fonts/Roboto-Bold.ttf

#	python_domodule tools/EventClients/lib/python/xbmcclient.py
#	python_newscript "tools/EventClients/Clients/Kodi Send/kodi-send.py" xbmc-send
}

pkg_postinst() {
	elog "Visit http://wiki.xbmc.org/?title=XBMC_Online_Manual"
}
