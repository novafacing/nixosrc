{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.layout = "us";
  services.xserver.displayManager.defaultSession = "none+i3";
  #services.xserver.desktopManager.default = "none+i3";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.libinput.enable = true;
}
