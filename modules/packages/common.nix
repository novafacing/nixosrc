{ config, pkgs, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
  # Yes, I paid for this. DO support the developer if you have not at https://www.aseprite.org/
in
{
  imports = [
    ./neovim.nix
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

