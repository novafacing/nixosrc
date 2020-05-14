{ config, pkgs, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
in
{
  imports = [
    ./neovim
    ./fonts.nix
    ./python
  ];

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

    # Console Utilities
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

    # i3 Hotkey Commands
    clipmenu
    maim
    pavucontrol
    brightnessctl

    # Development
    nodejs
    nodePackages.node2nix
    docker-compose

    # Node packages (see readme!)
    jsonlint
    eslint

    # Packages with configuration
    kitty
    rofi
    neovim

    # Libraries
    libgit2
  ];
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

