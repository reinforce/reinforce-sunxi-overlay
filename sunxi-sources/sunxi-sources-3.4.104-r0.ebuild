# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
ETYPE="sources"

K_SECURITY_UNSUPPORTED="1"

inherit kernel-2 versionator
detect_version
detect_arch

KEYWORDS="~arm ~x86 ~amd64"
HOMEPAGE="http://linux-sunxi.org"
DESCRIPTION="Linux source for Allwinner/Boxchip F20 (sun3i), A10 (sun4i), A12/A13/A10S (sun5i) and A20 (sun7i) SoCs"

# This is because portage drop -r0 revision in package version, but it need when fetching tarball
if [ ${PR} == "r0" ]; then
	SUNXI_VER="sunxi-v${PV}-${PR}"
else
	SUNXI_VER="sunxi-v${PVR}"
fi

SRC_URI="https://github.com/linux-sunxi/linux-sunxi/archive/${SUNXI_VER}.tar.gz -> sunxi-sources-${PVR}.tar.gz"

src_unpack() {
	unpack sunxi-sources-${PVR}.tar.gz
	mv "${WORKDIR}/linux-sunxi-${SUNXI_VER}" "${S}"
}
