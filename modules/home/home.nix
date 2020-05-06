{ config, pkgs, ... }:

let
  mod = "Mod1";
in
with pkgs.lib; {
  imports = [
    ../settings
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "novafacing";
    userEmail = "rowanbhart@gmail.com";
  };
}

