{ pkgs, options, config, lib, ... }:

{
  imports = [
    ./x.nix
    ./networking.nix
    # For ergodox EZ
    ./udev.nix
    ./fs.nix
  ];
}
