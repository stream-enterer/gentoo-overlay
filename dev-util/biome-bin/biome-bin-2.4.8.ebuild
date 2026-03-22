# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast formatter and linter for web languages"
HOMEPAGE="https://biomejs.dev https://github.com/biomejs/biome"

_MY_PV="${PV}"
_GH_URI="https://github.com/biomejs/biome/releases/download/%40biomejs/biome%40${_MY_PV}"
SRC_URI="
	amd64? ( ${_GH_URI}/biome-linux-x64 -> biome-${_MY_PV}-linux-x64 )
	arm64? ( ${_GH_URI}/biome-linux-arm64 -> biome-${_MY_PV}-linux-arm64 )
"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RESTRICT="strip"

QA_PREBUILT="usr/bin/biome"

S="${WORKDIR}"

src_install() {
	local bin
	if use amd64 ; then
		bin="biome-${_MY_PV}-linux-x64"
	elif use arm64 ; then
		bin="biome-${_MY_PV}-linux-arm64"
	fi

	newbin "${DISTDIR}/${bin}" biome
}
