{ pkgs, options, config, lib, ... }:

{
  # Go down through each submodule (EXCEPT home, home is managed by home-manager)
  # This is called automatically by import ./modules in configuration.nix
  imports = [
    ./desktop
    ./system
    ./packages
  ];
}
