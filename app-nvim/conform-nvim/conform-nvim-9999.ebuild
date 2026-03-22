# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 nvim-plugin

DESCRIPTION="Lightweight formatter plugin for Neovim"
HOMEPAGE="https://github.com/stevearc/conform.nvim"
EGIT_REPO_URI="https://github.com/stevearc/conform.nvim.git"

LICENSE="MIT"
SLOT="0"

NVIM_PLUGIN_HELPFILES="conform"
NVIM_PLUGIN_SETUP="conform"
