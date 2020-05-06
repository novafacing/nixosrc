{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    ./modules
  ];

  nixpkgs.config = import ./config/nixpkgs.nix;

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

  users.users.${config.settings.username} = {
    isNormalUser = true;
    createHome = true;
    home = "/home/${config.settings.username}";
    extraGroups = [ 
      "wheel" 
      "networkmanager"
    ];
  };

  home-manager.users.${config.settings.username} = import ./modules/home;

  system.stateVersion = "20.09"; # Did you read the comment?
}

