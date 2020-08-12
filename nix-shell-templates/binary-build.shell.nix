with import <nixpkgs> {};
mkShell {
  hardeningDisable = [
    "format"
  ];
  shellHook = ''
    export hardeningDisable=format
  '';
  nativeBuildInputs = with buildPackages; [
    autoconf
    automake
    gcc
    glibc
    gnumake
    bison
    flex
    ncurses
    readline
    texinfo
    pkg-config
    gmp
    mpfr
    libmpc
    freeimage
    zlib
    expat
    udev
    libusb
    lz4
    mesa
  ];
}
