# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 toolchain-funcs versionator

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/ssvb/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ssvb/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm"
fi

DESCRIPTION="Xorg DDX driver for Allwinner A10/A13 and other ARM devices"
IUSE="gles"

RDEPEND="x11-base/xorg-server
	gles? ( x11-drivers/mali-drivers[X] )
"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xproto
"

pkg_postinst() {
	elog "You need to edit the file /etc/X11/xorg.conf and set:"
	elog ""
	elog "        Identifier      \"Allwinner A10/A13 FBDEV\""
	elog "        Driver          \"fbturbo\""
	elog "        Option          \"fbdev\" \"/dev/fb0\""
	elog "        Option          \"SwapbuffersWait\" \"true\""
	elog ""
	elog "in the Graphics device section (Section \"Device\")"
	elog ""
	elog "Run "man fbturbo" to get additional information about the extra"
	elog "configuration options for tuning the driver."
}
