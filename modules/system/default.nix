{ pkgs, options, config, lib, ... }:

{
  imports = [
    ./x.nix
    ./networking.nix
    # For ergodox EZ
    ./udev.nix
    ./fs.nix
  ];
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
