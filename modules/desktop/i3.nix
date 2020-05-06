{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];
  services.xserver.enable = true;
  services.xserver.autorun = false;
  home-manager.users.novafacing.xsession = {
    scriptPath = ".hm-xsession";
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:escape";
  # services.xserver.displayManager.defaultSession = "none+i3";
  # services.xserver.desktopManager.default = "none+i3";
  services.xserver.desktopManager.session = [
    {
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$!
      '';
    }
  ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    naturalScrolling = true;
    tapping = false;
  };

}
