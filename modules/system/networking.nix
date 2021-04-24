{ config, pkgs, ... }:

{
  # TODO: Make this read from a file in config
  # Define networking
  networking.hostName = "chaos";
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
  networking.firewall.enable = true;
  programs.nm-applet.enable = true;
  networking.iproute2.enable = true;
  services.mullvad-vpn = {
    enable = true;
  };
  networking.wireguard = {
    enable = true;
  };
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };
}

