{ pkgs, options, config, lib, ... }:

{
  imports = [
    ./networking.nix
    ./users.nix
    ./git.nix
  ];
}
