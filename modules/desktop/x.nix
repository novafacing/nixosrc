{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    autorun = false;
    displayManager.defaultSession = "none+i3";
    xkbOptions = "caps:escape";
    libinput = {
      enable = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      tapping = false;
    };
  };
}
