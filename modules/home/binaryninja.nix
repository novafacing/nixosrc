{ config, lib, pkgs, fetchurl, ... }:

let
  configfile = ''
  {
      "updates": {
          "activeContent": false
      }
  }
  '';
in
  {
    home.file.".binaryninja/settings.json".text = configfile;
  }
