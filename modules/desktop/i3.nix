{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];
  services.xserver.enable = true;
  services.xserver.autorun = false;
  home-manager.users.novafacing.xsession = {
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
  services.xserver.layout = "us";
  services.xserver.displayManager.defaultSession = "none+i3";
  #services.xserver.desktopManager.default = "none+i3";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    naturalScrolling = true;
    tapping = false;
  };

}
