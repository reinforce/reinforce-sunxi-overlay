# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/linux-sunxi/libvdpau-sunxi.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/linux-sunxi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm"
fi

DESCRIPTION="Experimental VDPAU implementation for sunxi SoCs."
HOMEPAGE="https://github.com/linux-sunxi/libvdpau-sunxi"

LICENSE="GPLv2"
SLOT="0"
IUSE=""

DOCS="README"

RDEPEND="media-libs/libcedrus
	x11-libs/libX11
	x11-libs/libvdpau
	x11-drivers/mali-drivers"

DEPEND="${RDEPEND}"
