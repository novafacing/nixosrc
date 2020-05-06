{ config, pkgs, ... }:

let
  mod = "Mod1";
in
with pkgs.lib; {
  imports = [
    ../settings
    ./i3.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.git = {
    enable = true;
    userName = "novafacing";
    userEmail = "rowanbhart@gmail.com";
  };
}

