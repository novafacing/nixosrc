{ pkgs, options, config, lib, ... }:

{
  imports = [
    ./desktop
    ./system
    ./packages
  ];
}
