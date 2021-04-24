{config, pkgs, lib, stdenv, ... }:
let
  wrapper = pkgs.makeWrapper;
in
  let
  mySage = {
    nixpkgs.config.packageOverrides = pkgs: {
      sage = pkgs.sage.overrideAttrs(old: rec {
        /*
        buildInputs = [
        wrapper
        ];
        */
        sage-tests = stdenv.mkDerivation { name = "foo"; 
          builder = "${pkgs.bash}/bin/bash"; 
          args = [ 
            "echo"
            "hehe"
          ]; 
          system = builtins.currentSystem; 
        };

      });
    };
  };
in
  mySage
