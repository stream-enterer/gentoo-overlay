# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit nvim-plugin

DESCRIPTION="Gentoo and Portage syntax highlighting for Neovim"
HOMEPAGE="https://github.com/gentoo/gentoo-syntax"
SRC_URI="https://gitweb.gentoo.org/proj/gentoo-syntax.git/snapshot/${P}.tar.bz2"

LICENSE="vim"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 ~sparc x86 ~arm64-macos ~x64-macos ~x64-solaris"
IUSE="ignore-glep31"

NVIM_PLUGIN_HELPFILES="gentoo-syntax"

src_prepare() {
	default
	if use ignore-glep31 ; then
		for f in ftplugin/*.vim ; do
			ebegin "Removing UTF-8 rules from ${f} ..."
			sed -i -e 's~\(setlocal fileencoding=utf-8\)~" \1~' ${f} \
				|| die "waah! bad sed voodoo. need more goats."
			eend $?
		done
	fi
}
