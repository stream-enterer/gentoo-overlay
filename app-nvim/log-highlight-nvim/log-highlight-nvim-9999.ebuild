# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 nvim-plugin

DESCRIPTION="Neovim plugin for generic log file highlighting"
HOMEPAGE="https://github.com/fei6409/log-highlight.nvim"
EGIT_REPO_URI="https://github.com/fei6409/log-highlight.nvim.git"

LICENSE="MIT"
SLOT="0"

NVIM_PLUGIN_SETUP="log-highlight"
