{ config, pkgs, ... }:

{
  imports = [
    #./neovim.nix
    #./kitty.nix
    #./rofi.nix
    #./i3blocks.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    # One and done
    brave
    wget
    curl
    exa
    bat

    # Packages with configuration
    kitty
    rofi
    neovim
  ];
}

