# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools git-2

HOMEPAGE="https://github.com/robclark/libdri2"
DESCRIPTION="Library for the DRI2 extension to the X Window System"
EGIT_REPO_URI="https://github.com/robclark/libdri2.git"

SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libdrm
	x11-proto/xextproto
"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf -i
}
