{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    #./kitty.nix
    #./rofi.nix
    #./i3blocks.nix
    ./fonts.nix
    ./python
  ];

  environment.systemPackages = with pkgs; [
    # GUI Apps
    chromium
    discord
    spotify
    zathura
    my.bumblebee-status

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

    # Packages with configuration
    kitty
    rofi
    neovim
    # my.i3-round

    # Libraries
    libgit2
  ];

  programs.gnupg.agent.enable = true;
}

