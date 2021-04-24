{ pkgs, options, config, stdenv, lib, ... }:

{
  imports = [
    ./common.nix
    ./custom.nix
  ];
}
