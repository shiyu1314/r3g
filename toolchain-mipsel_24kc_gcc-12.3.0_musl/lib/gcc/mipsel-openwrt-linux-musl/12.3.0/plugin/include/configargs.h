/* Generated automatically. */
static const char configuration_arguments[] = "/workdir/openwrt/build_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl/gcc-12.3.0/configure --with-bugurl=http://bugs.openwrt.org/ --with-pkgversion='OpenWrt GCC 12.3.0 r24145-db554fd450' --prefix=/workdir/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=mipsel-openwrt-linux-musl --with-gnu-ld --enable-target-optspace --disable-libgomp --disable-libmudflap --disable-multilib --disable-libmpx --disable-nls --disable-libssp --without-isl --without-cloog --with-host-libstdcxx=-lstdc++ --with-float=soft --with-system-zlib=/workdir/openwrt/staging_dir/host --with-zstd=/workdir/openwrt/staging_dir/host --with-gmp=/workdir/openwrt/staging_dir/host --with-mpfr=/workdir/openwrt/staging_dir/host --with-mpc=/workdir/openwrt/staging_dir/host --disable-decimal-float --with-diagnostics-color=auto-if-env --enable-__cxa_atexit --enable-libstdcxx-dual-abi --with-default-libstdcxx-abi=new --with-mips-plt CFLAGS='-O2 -I/workdir/openwrt/staging_dir/host/include  -pipe' CXXFLAGS='-O2 -I/workdir/openwrt/staging_dir/host/include  -pipe' 'CFLAGS_FOR_TARGET=-Os -pipe -mno-branch-likely -mips32r2 -mtune=24kc -fno-caller-saves -fno-plt -fhonour-copts -msoft-float -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro' 'CXXFLAGS_FOR_TARGET=-Os -pipe -mno-branch-likely -mips32r2 -mtune=24kc -fno-caller-saves -fno-plt -fhonour-copts -msoft-float -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro' 'GOCFLAGS_FOR_TARGET=-Os -pipe -mno-branch-likely -mips32r2 -mtune=24kc -fno-caller-saves -fno-plt -fhonour-copts -msoft-float -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro' --with-headers=/workdir/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl/include --enable-languages=c,c++ --enable-shared --enable-threads --with-slibdir=/workdir/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl/lib --enable-plugins --enable-lto --with-libelf=/workdir/openwrt/staging_dir/host --disable-libsanitizer";
static const char thread_model[] = "posix";

static const struct {
  const char *name, *value;
} configure_default_options[] = { { "float", "soft" }, { "llsc", "llsc" }, { "mips-plt", "plt" } };