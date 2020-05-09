{ config, pkgs, ... }:

let
  mod = "Mod1";
  settings = import ../../config/settings.nix;
in
with pkgs.lib; {
  imports = [
    ./i3.nix
    ./zsh.nix
    #./nvim.nix
    ./kitty.nix
  ];

  nixpkgs.config = {
    allowUnfree = settings.allowUnfree;
  };

  programs.git = {
    enable = true;
    userName = settings.name;
    userEmail = settings.email;
  };
}

