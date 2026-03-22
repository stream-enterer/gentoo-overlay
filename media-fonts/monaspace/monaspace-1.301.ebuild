# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="An innovative superfamily of monospace fonts by GitHub"
HOMEPAGE="https://github.com/githubnext/monaspace"

_GH_URI="https://github.com/githubnext/monaspace/releases/download/v${PV}"
SRC_URI="
	variable? ( ${_GH_URI}/${PN}-variable-v${PV}.zip )
	static? ( ${_GH_URI}/${PN}-static-v${PV}.zip )
	frozen? ( ${_GH_URI}/${PN}-frozen-v${PV}.zip )
	nerdfonts? ( ${_GH_URI}/${PN}-nerdfonts-v${PV}.zip )
"
S="${WORKDIR}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~x86"

IUSE="+variable static frozen nerdfonts +argon +krypton +neon +radon +xenon"
REQUIRED_USE="
	|| ( variable static frozen nerdfonts )
	|| ( argon krypton neon radon xenon )
"

BDEPEND="app-arch/unzip"

src_install() {
	FONT_SUFFIX=""
	if use variable || use frozen ; then
		FONT_SUFFIX+="ttf "
	fi
	if use static || use nerdfonts ; then
		FONT_SUFFIX+="otf "
	fi

	local families=()
	use argon && families+=( Argon )
	use krypton && families+=( Krypton )
	use neon && families+=( Neon )
	use radon && families+=( Radon )
	use xenon && families+=( Xenon )

	mkdir -p "${T}"/fonts || die

	local family
	for family in "${families[@]}" ; do
		if use variable ; then
			cp "${S}/Variable Fonts/Monaspace ${family}/"*.ttf "${T}"/fonts/ 2>/dev/null
		fi
		if use static ; then
			cp "${S}/Static Fonts/Monaspace ${family}/"*.otf "${T}"/fonts/ 2>/dev/null
		fi
		if use frozen ; then
			cp "${S}/Frozen Fonts/Monaspace ${family}/"*.ttf "${T}"/fonts/ 2>/dev/null
		fi
		if use nerdfonts ; then
			cp "${S}/NerdFonts/Monaspace ${family}/"*.otf "${T}"/fonts/ 2>/dev/null
		fi
	done

	FONT_S="${T}/fonts" font_src_install
}
