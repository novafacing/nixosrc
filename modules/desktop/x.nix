{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    autorun = false;
    displayManager.defaultSession = "none+i3";
    libinput = {
      enable = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      tapping = false;
    };
  };
}
