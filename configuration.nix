{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./modules
  ];

  # Install packages to /etc/profiles
  home-manager.useUserPackages = true;
  # Use the global pkgs 
  home-manager.useGlobalPkgs = true;

  # Enable systemd + settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure timezone
  time.timeZone = "America/Indiana/Indianapolis";

  # Add any MUST-have packages (for example when something breaks)
  environment.systemPackages = with pkgs; [
    neovim
  ];

  # Hardware options

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  system.stateVersion = "20.09"; # Did you read the comment?

}

