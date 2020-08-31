{ config, pkgs, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
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
  };

  environment.systemPackages = with pkgs // myNodePackages; [
    # GUI Apps
    arandr
    adobe-reader
    audacity
    blender
    chromium
    slack
    discord
    etcher
    bitwarden
    gcolor3
    gimp
    googleearth
    gparted
    inkscape
    my.bumblebee-status
    my.aseprite
    signal-desktop
    hexchat
    skypeforlinux
    thunderbird
    spotify
    steam
    twmn
    unetbootin
    woeusb
    zathura
    vlc
    dfilemanager
    rawtherapee
    obs-studio
    obs-linuxbrowser
    my.ndi
    obsndi
    # my.myobs-ndi
    firefox
    inkscape

    # Reversing tools
    my.binaryninja
    afl
    gdb
    ghidra-bin
    radare2
    wireshark
    

    # Console Utilities
    appimage-run
    bat
    coreutils
    curl
    exa
    feh
    file
    gnupg
    nix-index
    silver-searcher
    gotop
    htop
    my.wally-cli
    my.ocra
    ncdu
    nox
    parted
    pinentry-curses
    pypi2nix
    openjdk
    # sageWithDoc
    texlive.combined.scheme-full
    unzip
    openvpn
    wget
    # wineWowPackages.staging
    wine
    winetricks
    xclip
    xxd
    zip
    ncspot
    my.nix-doc
    nix-du
    lz4
    ltrace
    graphviz
    whois
    nmap
    bind

    # i3 Hotkey Commands
    brightnessctl
    clipmenu
    maim
    pavucontrol

    # Development
    binutils
    bison
    cabal-install
    clang
    clangMultiStdenv
    cmake
    docker-compose
    doxygen
    flex
    gcc
    gnumake
    gcc_multi
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
    valgrind
    sloccount
    love
    lua

    # Node packages (see readme!)
    eslint
    jsonlint

    # Packages with configuration
    kitty
    neovim
    rofi
  ];

  # Dev manpages
  documentation.dev.enable = true;
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

