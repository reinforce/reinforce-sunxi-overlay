# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/linux-sunxi/libcedrus.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/linux-sunxi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~arm"
fi

DESCRIPTION="libcedrus provides low-level access to the video engine of Allwinner sunxi SoCs"
HOMEPAGE="http://linux-sunxi.org/Cedrus"

LICENSE="GPLv2"
SLOT="0"
IUSE=""

