{ config, pkgs, stdenv, fetchurl, fetchgit, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
  luaPkgs = (pkgs.callPackage ./lua {});
  #gnuradio = (pkgs.callPackage ./gnuradio {
  #  inherit (pkgs.python27Full // pkgs.python27Packages) numpy# scipy matplotlib Mako cheetah pygtk pyqt4 wxPython lxml Cor#eAudio pyopengl requiredPythonModules setuptools;
  #  fftw = pkgs.fftwFloat;
  #  uhd = null;
  #});
in
let
  luaWithPackages = (pkgs.lua5_2_compat.withPackages(ps: with ps // luaPkgs; [
    # Custom Lua Packages
    lapis

    # Builtin Lua Packages
    luasocket
    luafilesystem
    moonscript
    lpeg
  ])).override(args: { 
    ignoreCollisions = true; 
  });
in
  with (import <nixpkgs> {}); {
    imports = [
      ./neovim
      ./fonts.nix
      ./python
    ];

    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      openresty = pkgs.openresty.override {
        configureFlags = [
          "--with-http_postgres_module"
          "--with-luajit"
        ];
      };
    };

    environment.systemPackages = with pkgs // myNodePackages; [
    # GUI Apps
    # my.myobs-ndi
    # adobe-reader
    arandr
    audacity
    bc
    bitwarden
    blender
    cabal2nix
    chromium
    coq
    dfilemanager
    discord-canary
    etcher
    firefox
    fsuae
    gcolor2
    gcolor3
    ghc
    gimp
    googleearth
    google-drive-ocamlfuse
    gparted
    hexchat
    ifuse
    inkscape
    inkscape
    libimobiledevice
    my.aseprite
    my.bumblebee-status
    #my.ndi
    my.jflap
    #obs-linuxbrowser
    obs-v4l2sink
    obs-studio
    one_gadget
    #obsndi
    #rawtherapee
    signal-desktop
    skypeforlinux
    slack
    my.smartgit
    #my.avrgcc-wrapper
    reaper
    qpaeq
    spotify
    steam
    thunderbird
    tikzit
    twmn
    unetbootin
    vlc
    wakelan
    woeusb
    zathura
    gnome3.zenity
    #xdot
    dot2tex
    zoom-us
    rustc
    rustup

    # Reversing tools
    afl
    appimagekit
    gdb
    ghidra-bin
    my.binaryninja
    exiftool
    radare2
    squashfsTools
    #my.sage
    wireshark
    pypy3
    gradle


    # Console Utilities
    # sageWithDoc
    # wineWowPackages.staging
    appimage-run
    bat
    bind
    coreutils
    universal-ctags
    curl
    exa
    feh
    ffmpeg
    file
    gnupg
    gotop
    graphviz
    htop
    llvm
    ltrace
    lz4
    my.nix-doc
    my.ocra
    my.wally-cli
    nasm
    ncdu
    ncspot
    nix-du
    nix-index
    nmap
    nmap_graphical
    nox
    openjdk
    jdk11
    openvpn
    parted
    fzf
    pdfgrep
    pinentry-curses
    pypi2nix
    silver-searcher
    sshfs
    sshuttle
    sqlite
    texlive.combined.scheme-full
    unzip
    wget
    whois
    wine
    winetricks
    xclip
    xxd
    zip

    # i3 Hotkey Commands
    brightnessctl
    clipmenu
    maim
    pavucontrol
    noisetorch

    # Development
    arduino
    ascii
    avrdude
    binutils
    bison
    cabal-install
    ccls
    colordiff
    clang_11
    clangMultiStdenv
    cmake
    docker-compose
    doxygen
    flex
    gcc10
    gcc_multi
    gnumake
    #gnuradio
    lldb_11
    manpages
    meson
    mgba
    my.autopatchelf
    my.buildShellShim
    ninja
    nodePackages.node2nix
    nodejs
    patchelf
    pkg-config
    postman
    rgbds
    sloccount
    valgrind

    # Gnuradio needs
    gsl
    qt4
    qwt

    # Lua
    luaWithPackages

    #Additional Lua Utilities
    love
    openresty

    # Node packages (see readme!)
    eslint
    jsonlint

    # Packages with configuration
    kitty
    neovim
    rofi
    rofi-emoji

    # Libraries
    llvmPackages.libclang.lib
    llvmPackages.libclang
  ];

  # Dev manpages
  documentation.dev.enable = true;
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

