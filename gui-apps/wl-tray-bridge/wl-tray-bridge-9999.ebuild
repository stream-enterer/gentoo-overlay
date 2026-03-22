# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.85.0"

inherit cargo git-r3

DESCRIPTION="System tray bridge for Wayland compositors using the jay-tray-v1 protocol"
HOMEPAGE="https://github.com/mahkoh/wl-tray-bridge"
EGIT_REPO_URI="https://github.com/mahkoh/wl-tray-bridge.git"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 ZLIB"
SLOT="0"
IUSE="ext-tray"

DEPEND="
	x11-libs/pango
	x11-libs/cairo
"
RDEPEND="
	${DEPEND}
	gui-wm/jay
"
BDEPEND="
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/wl-tray-bridge"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	local myfeatures=(
		$(usev ext-tray)
	)
	cargo_src_configure
}
