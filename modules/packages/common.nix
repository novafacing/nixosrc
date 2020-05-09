{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    #./kitty.nix
    #./rofi.nix
    #./i3blocks.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    # One and done
    chromium
    wget
    curl
    exa
    htop
    gotop
    bat
    discord
    spotify
    zip
    ncdu
    xclip
    gnupg
    pinentry-curses

    # Packages with configuration
    kitty
    rofi
    neovim
    texlive.combined.scheme-medium
    zathura
  ];

  programs.gnupg.agent.enable = true;
}

