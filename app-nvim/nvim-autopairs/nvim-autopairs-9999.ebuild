# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 nvim-plugin

DESCRIPTION="Autopairs for Neovim written in Lua"
HOMEPAGE="https://github.com/windwp/nvim-autopairs"
EGIT_REPO_URI="https://github.com/windwp/nvim-autopairs.git"

LICENSE="MIT"
SLOT="0"

NVIM_PLUGIN_HELPFILES="nvim-autopairs"
NVIM_PLUGIN_SETUP="nvim-autopairs"
