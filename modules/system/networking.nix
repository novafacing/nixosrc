{ config, pkgs, ... }:

{
  networking.hostName = "chaos";
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
  networking.firewall.enable = true;
}

