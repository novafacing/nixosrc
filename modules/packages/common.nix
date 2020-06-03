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
    chromium
    discord
    spotify
    zathura
    my.bumblebee-status
    gcolor3
    arandr
    twmn
    blender
    inkscape
    steam
    etcher
    gparted
    woeusb
    unetbootin
    skypeforlinux
    googleearth
    gimp
    signal-desktop

    # Reversing tools
    afl
    ghidra-bin
    wireshark
    radare2
    #my.binaryninja
    #my.gdb
    

    # Console Utilities
    coreutils
    file
    bat
    curl
    exa
    feh
    gnupg
    gotop
    htop
    ncdu
    pinentry-curses
    pypi2nix
    texlive.combined.scheme-medium
    wget
    xclip
    zip
    unzip
    parted
    my.wally-cli
    wineWowPackages.staging

    # i3 Hotkey Commands
    clipmenu
    maim
    pavucontrol
    brightnessctl

    # Development
    nodejs
    nodePackages.node2nix
    docker-compose
    cmake
    gcc
    clang
    bison
    flex
    pkg-config
    valgrind
    patchelf
    my.autopatchelf
    binutils
    meson
    ninja
    my.buildShellShim

    # Node packages (see readme!)
    jsonlint
    eslint

    # Packages with configuration
    kitty
    rofi
    neovim

    # Libraries
    libgit2
    libusb
    libbfd
    glibc
    zlib
    gcc-unwrapped
    openssl
  ];

  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

