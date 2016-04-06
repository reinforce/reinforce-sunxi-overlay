# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools git-2

HOMEPAGE="https://github.com/linux-sunxi/libump"
DESCRIPTION="Unified Memory Provider userspace API source code needed for xf86-video-mali compilation"
EGIT_REPO_URI="https://github.com/linux-sunxi/libump.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

src_prepare() {
	eautoreconf -i
}
