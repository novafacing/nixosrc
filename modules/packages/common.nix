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
    # my.myobs-ndi
    adobe-reader
    arandr
    audacity
    bitwarden
    blender
    chromium
    coq
    dfilemanager
    discord
    etcher
    firefox
    gcolor3
    gimp
    googleearth
    gparted
    hexchat
    inkscape
    inkscape
    my.aseprite
    my.bumblebee-status
    my.ndi
    obs-linuxbrowser
    obs-v4l2sink
    obs-studio
    obsndi
    rawtherapee
    signal-desktop
    skypeforlinux
    slack
    my.smartgit
    spotify
    steam
    thunderbird
    tikzit
    twmn
    unetbootin
    vlc
    woeusb
    zathura
    zoom

    # Reversing tools
    afl
    appimagekit
    gdb
    ghidra-bin
    my.binaryninja
    radare2
    squashfsTools
    my.sage
    wireshark
    

    # Console Utilities
    # sageWithDoc
    # wineWowPackages.staging
    appimage-run
    bat
    bind
    coreutils
    curl
    exa
    feh
    ffmpeg
    file
    gnupg
    gotop
    graphviz
    htop
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
    openvpn
    parted
    pinentry-curses
    pypi2nix
    silver-searcher
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
    gcc_multi
    gnumake
    love
    lua
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

