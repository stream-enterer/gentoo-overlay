# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="The Libertinus font family, a fork of Linux Libertine/Biolinum"
HOMEPAGE="https://github.com/alerque/libertinus"
SRC_URI="https://github.com/alerque/${PN}/releases/download/v${PV}/Libertinus-${PV}.zip"
S="${WORKDIR}/Libertinus-${PV}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~x86"

FONT_SUFFIX="otf"

src_install() {
	# Only install static (non-variable) OTF files
	FONT_S="${S}/static/OTF" font_src_install
}
