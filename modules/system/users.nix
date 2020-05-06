{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];
  users.users.novafacing = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" 
      "networkmanager"
    ];
  };

  home-manager.users.novafacing = {
    pkgs,
    ...
  }: {
    programs.git = {
      enable = true;
      userName = "novafacing";
      userEmail = "rowanbhart@gmail.com";
    };
  };
}
