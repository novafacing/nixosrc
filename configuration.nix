{ config, pkgs, ... }:
let
  settings = import ./config/settings.nix;
in
{
  imports = [
    # hardware-configuration.nix will be different per system, 
    # luckily the autogenerated one is good to go in most cases.
    ./hardware-configuration.nix
    # This gives us access to the <home-manager/nixos> package for use later on
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
    # This descends into the modules directory where most of the configs are stored
    # directory imports look for a default.nix and run it
    ./modules
  ];

  # Allows configuration of the nixpkgs (basically if you want free only or also nonfree)
  # Like above, the import just runs that nix file

  # Enable systemd + settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure timezone
  time.timeZone = "America/Indiana/Indianapolis";

  # Hardware options
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  networking.firewall.allowedTCPPortRanges = [
    { 
      from = 5960;
      to = 5970;
    }
  ];

  # This is needed for steam
  hardware.opengl.driSupport32Bit = true;

  # Use the config file to create a username with the correct settings
  users.users.${settings.username} = {
    isNormalUser = true;
    createHome = true;
    home = "/home/${settings.username}";
    extraGroups = [ 
      "wheel" 
      "networkmanager"
      "docker"
      "audio"
      "video"
      "vboxusers"
    ];
    shell = pkgs.zsh;
  };

  #services.fprintd.enable = true;
  #security.pam.services.login.fprintAuth = true;
  #security.pam.services.sudo.fprintAuth = true;
  security.sudo.enable = true;
  security.sudo.extraConfig = ''
    %wheel ALL=(ALL) NOPASSWD: ALL
  '';

  # Add ourselves to the home-manager config and use home manager to set up 
  # whatever we want to use home-manager for. Sometimes home-manager is helpful and
  # makes things easier, sometimes it makes them harder. Depends ;)
  home-manager.users.${settings.username} = import ./modules/home;

  # The nixos version :)
  system.stateVersion = "20.09";
}

