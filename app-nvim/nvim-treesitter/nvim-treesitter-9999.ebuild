# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 nvim-plugin

DESCRIPTION="Treesitter queries and Lua utilities for Neovim"
HOMEPAGE="https://github.com/nvim-treesitter/nvim-treesitter"
EGIT_REPO_URI="https://github.com/nvim-treesitter/nvim-treesitter.git"

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND+=" dev-util/tree-sitter-cli"

NVIM_PLUGIN_HELPFILES="nvim-treesitter"

src_install() {
	nvim-plugin_src_install

	# Query files live under runtime/ in the repo but need to be
	# installed directly so Neovim finds them at <runtimepath>/queries/
	if [[ -d runtime/queries ]] ; then
		# Remove queries for languages bundled with Neovim to avoid
		# version mismatches with Neovim's bundled parsers
		local bundled
		for bundled in c lua markdown markdown_inline query vim vimdoc ; do
			rm -rf runtime/queries/${bundled} || die
		done

		insinto /usr/share/nvim/site
		doins -r runtime/queries
	fi
}
