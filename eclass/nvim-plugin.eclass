# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: nvim-plugin.eclass
# @MAINTAINER:
# a0@localhost
# @SUPPORTED_EAPIS: 8
# @BLURB: used for installing Neovim plugins
# @DESCRIPTION:
# This eclass simplifies installation of Neovim plugins into
# /usr/share/nvim/site, which is in Neovim's default runtimepath.

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_NVIM_PLUGIN_ECLASS} ]]; then
_NVIM_PLUGIN_ECLASS=1

RDEPEND="app-editors/neovim"

# @ECLASS_VARIABLE: NVIM_PLUGIN_HELPFILES
# @DEFAULT_UNSET
# @DESCRIPTION:
# Space-separated list of help topics provided by this plugin.
# If set, pkg_postinst will display :help instructions.

# @ECLASS_VARIABLE: NVIM_PLUGIN_SETUP
# @DEFAULT_UNSET
# @DESCRIPTION:
# If set, pkg_postinst will note that require('<value>').setup {} is needed.

_NVIM_PLUGIN_DIRS=(
	after autoload colors compiler ftdetect ftplugin indent
	keymap lua plugin queries spell syntax
)

# @FUNCTION: nvim-plugin_src_install
# @DESCRIPTION:
# Installs plugin files into /usr/share/nvim/site.
# Only installs doc/ if it contains vim help files (*.txt).
nvim-plugin_src_install() {
	insinto /usr/share/nvim/site
	local d
	for d in "${_NVIM_PLUGIN_DIRS[@]}" "$@" ; do
		[[ -d "${d}" ]] || continue
		doins -r "${d}"
	done

	# Only install doc/ if it contains help files
	if [[ -d doc ]] && ls doc/*.txt &>/dev/null ; then
		doins -r doc
	fi

	einstalldocs
}

# @FUNCTION: nvim-plugin_pkg_postinst
# @DESCRIPTION:
# Displays help and setup information for the plugin.
nvim-plugin_pkg_postinst() {
	local h

	if [[ -n ${NVIM_PLUGIN_HELPFILES} ]]; then
		elog "This plugin provides documentation via :help"
		elog "To view it, use:"
		for h in ${NVIM_PLUGIN_HELPFILES}; do
			elog "    :help ${h}"
		done
	fi

	if [[ -n ${NVIM_PLUGIN_SETUP} ]]; then
		elog "This plugin must be activated in your init.lua:"
		elog "    require('${NVIM_PLUGIN_SETUP}').setup {}"
	fi
}

fi

EXPORT_FUNCTIONS src_install pkg_postinst
