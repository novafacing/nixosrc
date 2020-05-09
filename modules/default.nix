{ pkgs, options, config, lib, ... }:

{
  # Go down through each submodule (EXCEPT home, home is managed by home-manager)
  imports = [
    ./desktop
    ./system
    ./packages
  ];
}
