# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base eutils git-2 multilib udev

DESCRIPTION="Sunxi Mali-400 support libraries"
HOMEPAGE="https://github.com/linux-sunxi/sunxi-mali"

EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-mali.git"
EGIT_HAS_SUBMODULES=1

LICENSE="unknown"
SLOT="0"
KEYWORDS="~arm"
IUSE="X"

COMMON="
	X? (
		>=app-eselect/eselect-opengl-1.0.9
	)
"

DEPEND="
	${COMMON}
"

RDEPEND="
	${COMMON}
	X? (
		x11-base/xorg-server
		x11-libs/libdri2
	)
	x11-libs/libump
"

RESTRICT="strip"

src_configure() {
	local egl_type="framebuffer"
	local mali_version="r3p0"

	use X && egl_type="x11"

	emake config ABI=armhf EGL_TYPE="${egl_type}" VERSION="${mali_version}" || die

	touch .gles-only
}

src_install() {
	local opengl_imp="mali"
	local opengl_dir="/usr/$(get_libdir)/opengl/${opengl_imp}"

	# Create dirs
	dodir "${opengl_dir}"/{lib,extensions,include}

	# Install to opengl_dir because user can eselect desired GL provider.
	emake DESTDIR="${D}" prefix="${opengl_dir}"/ install

	# Udev rules to get the right ownership/permission for /dev/ump and /dev/mali
	udev_newrules "${FILESDIR}"/99-mali-drivers.rules 99-mali-drivers.rules

	# libMali provides only gles implementation
	insinto "${opengl_dir}"
	doins .gles-only
}

pkg_postinst() {
	elog "You must be in the video group to use the Mali 3D acceleration."
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set mali\""
}
