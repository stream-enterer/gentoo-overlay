# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 nvim-plugin

DESCRIPTION="Jump to any location specified by two characters"
HOMEPAGE="https://github.com/justinmk/vim-sneak"
EGIT_REPO_URI="https://github.com/justinmk/vim-sneak.git"

LICENSE="MIT"
SLOT="0"

NVIM_PLUGIN_HELPFILES="sneak"
