# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.32
	ab_glyph_rasterizer@0.1.10
	addr2line@0.25.1
	adler2@2.0.1
	ahash@0.8.12
	aho-corasick@1.1.4
	android_system_properties@0.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	arrayref@0.3.9
	arrayvec@0.7.6
	autocfg@1.5.0
	backtrace@0.3.76
	bincode@1.3.3
	bitflags@2.11.0
	blake3@1.8.3
	bstr@1.12.1
	bumpalo@3.20.2
	bytemuck@1.25.0
	byteorder@1.5.0
	cc@1.2.56
	cfg-if@1.0.4
	chacha20@0.10.0
	chrono@0.4.44
	clap@4.6.0
	clap_builder@4.6.0
	clap_complete@4.6.0
	clap_derive@4.6.0
	clap_lex@1.1.0
	colorchoice@1.0.5
	constant_time_eq@0.4.2
	core-foundation-sys@0.8.7
	cpufeatures@0.2.17
	cpufeatures@0.3.0
	crc32fast@1.5.0
	debug-fn@1.0.0
	deranged@0.5.8
	dirs-sys@0.5.0
	dirs@6.0.0
	ecolor@0.33.3
	egui@0.33.3
	egui_tiles@0.14.1
	either@1.15.0
	emath@0.33.3
	epaint@0.33.3
	equivalent@1.0.2
	errno@0.3.14
	error_reporter@1.0.0
	fastrand@2.3.0
	fdeflate@0.3.7
	find-msvc-tools@0.1.9
	flate2@1.1.9
	foldhash@0.1.5
	futures-core@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.2
	gimli@0.32.3
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	hashbrown@0.15.5
	hashbrown@0.16.1
	heck@0.5.0
	humantime@2.3.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	id-arena@2.3.0
	indexmap@2.13.0
	is_terminal_polyfill@1.70.2
	isnt@0.1.0
	isnt@0.2.0
	itertools@0.14.0
	itoa@1.0.17
	jay-ash@0.3.0+1.4.344
	js-sys@0.3.91
	kbvm-proc@0.2.0
	kbvm@0.1.6
	lazy_static@1.5.0
	leb128fmt@0.1.0
	libc@0.2.183
	libloading@0.9.0
	libredox@0.1.14
	linearize-derive@0.2.1
	linearize@0.1.6
	linux-raw-sys@0.12.1
	lock_api@0.4.14
	log@0.4.29
	memchr@2.8.0
	miniz_oxide@0.8.9
	nohash-hasher@0.2.0
	num-conv@0.2.0
	num-derive@0.4.2
	num-traits@0.2.19
	num_threads@0.1.7
	object@0.37.3
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	opera@1.0.1
	option-ext@0.2.0
	owned_ttf_parser@0.25.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	phf@0.13.1
	phf_generator@0.13.1
	phf_macros@0.13.1
	phf_shared@0.13.1
	pin-project-internal@1.1.11
	pin-project-lite@0.2.17
	pin-project@1.1.11
	pkg-config@0.3.32
	png@0.18.1
	powerfmt@0.2.0
	prettyplease@0.2.37
	proc-macro2@1.0.106
	profiling@1.0.17
	quick-xml@0.39.2
	quote@1.0.45
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.10.0
	rand@0.8.5
	rand@0.9.2
	rand_core@0.10.0
	rand_core@0.6.4
	rand_core@0.9.5
	redox_syscall@0.5.18
	redox_users@0.5.2
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	repc-impl@0.1.1
	repc@0.1.1
	run-on-drop@1.0.0
	rustc-demangle@0.1.27
	rustix@1.1.4
	rustversion@1.0.22
	ryu@1.0.23
	same-file@1.0.6
	scopeguard@1.2.0
	secure-execution@0.1.0
	semver@1.0.27
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	serde_yaml@0.9.34+deprecated
	shlex@1.3.0
	simd-adler32@0.3.8
	simplelog@0.12.2
	siphasher@1.0.2
	slab@0.4.12
	smallvec@1.15.1
	strict-num@0.1.1
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.117
	termcolor@1.4.1
	terminal_size@0.4.3
	thiserror-impl@2.0.18
	thiserror@2.0.18
	time-core@0.1.8
	time-macros@0.2.27
	time@0.3.47
	tiny-skia-path@0.12.0
	tiny-skia@0.12.0
	tracy-client-sys@0.24.3
	ttf-parser@0.25.1
	uapi-proc@0.0.5
	uapi@0.2.13
	unicode-ident@1.0.24
	unicode-segmentation@1.12.0
	unicode-width@0.2.2
	unicode-xid@0.2.6
	unsafe-libyaml@0.2.11
	utf8parse@0.2.2
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.2+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-bindgen-macro-support@0.2.114
	wasm-bindgen-macro@0.2.114
	wasm-bindgen-shared@0.2.114
	wasm-bindgen@0.2.114
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasmparser@0.244.0
	winapi-util@0.1.11
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-component@0.244.0
	wit-parser@0.244.0
	with_builtin_macros-proc_macros@0.1.0
	with_builtin_macros@0.1.0
	zerocopy-derive@0.8.42
	zerocopy@0.8.42
	zmij@1.0.21
"

RUST_MIN_VER="1.93.0"

inherit cargo

DESCRIPTION="A tiling Wayland compositor"
HOMEPAGE="https://github.com/mahkoh/jay"
SRC_URI="
	https://github.com/mahkoh/jay/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD ISC MIT MPL-2.0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X pipewire"

DEPEND="
	dev-libs/libinput:=
	x11-libs/libdrm
	virtual/udev
	x11-libs/pango
	media-libs/fontconfig
	media-libs/mesa
"
RDEPEND="
	${DEPEND}
	|| ( sys-auth/elogind sys-apps/systemd )
	media-libs/mesa[egl(+)]
	media-libs/libglvnd
	media-libs/vulkan-loader
	pipewire? ( media-video/pipewire )
	X? ( x11-base/xwayland )
"
BDEPEND="
	virtual/pkgconfig
"

# Rust toolchain configuration
QA_FLAGS_IGNORED="usr/bin/jay"

src_install() {
	cargo_src_install

	insinto /etc/jay
	newins toml-config/src/default-config.toml config.toml

	insinto /usr/share/xdg-desktop-portal/portals
	doins etc/jay.portal

	insinto /usr/share/xdg-desktop-portal
	doins etc/jay-portals.conf

	insinto /usr/share/wayland-sessions
	doins etc/jay.desktop
}
