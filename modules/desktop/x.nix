{ config, pkgs, ... }:
{
  # This is the SYSTEM X server settings
  # home-manager needs these set for its local X server settings
  # to work correctly.
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
    # Autorun off, we run `sudo systemctl start display-manager` to start GUI
    autorun = false;
    displayManager.defaultSession = "none+i3";
    # Swap caps lock with escape
    xkbOptions = "caps:escape";
    # Enable my trackpad settings
    libinput = {
      enable = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      tapping = false;
    };
  };
}
