# This is just a set of settings I use in a few different places.
{
  # Options config
  allowUnfree = true; # Sorry stallman senpai sama uwu
  name = "Rowan Hart";
  username = "novafacing";
  email = "rowanbhart@gmail.com";
  vm = false;
  terminal = "kitty";
  fontName = "Fira Code";
  fontSize = 12;

  # Network config
  networking = {
    hostName = "chaos";
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      enable = true;
    };
    interfaces = {
      enp0s31f6 = {
        useDHCP = true;
      };
      wlp2s0 = {
        useDHCP = true;
      };
    };
  };
}
