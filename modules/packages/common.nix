{ config, pkgs, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
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

    # Node packages (see readme!)
    jsonlint
    eslint

    # Packages with configuration
    kitty
    rofi
    neovim
    # my.i3-round

    # Libraries
    libgit2
  ];
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

