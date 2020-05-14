{ pkgs, options, config, lib, ... }:

{
  imports = [
    ./x.nix
    ./networking.nix
  ];
}
