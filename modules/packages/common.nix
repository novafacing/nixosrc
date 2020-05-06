{ config, pkgs, ... }:

{
  imports = [
    #./neovim.nix
    #./kitty.nix
    #./rofi.nix
    #./i3blocks.nix
  ];
  environment.systemPackages = with pkgs; [
    # One and done
    brave
    wget
    curl

    # Packages with configuration
    kitty
    rofi
    neovim

  ];
}

