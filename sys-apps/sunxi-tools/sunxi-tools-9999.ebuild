# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2

EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-tools.git"
DESCRIPTION="Tools to help hacking Allwinner A10 devices"

KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
SLOT="0"

RDEPEND="virtual/libusb"
DEPEND="${RDEPEND}"

src_install() {
	dobin bootinfo fel fexc nand-part pio || die
	dosym fexc /usr/bin/fex2bin || die
	dosym fexc /usr/bin/bin2fex || die
}
