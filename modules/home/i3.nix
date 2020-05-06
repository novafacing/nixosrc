{ config, pkgs, ... }:

let
  mod = "Mod1";
  sup = "Mod4";
in
with pkgs.lib; {

  ## NixOS X/Libinput Configs (required!)
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

  # These are the home-manager configs for X
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      super = sup;

      bars = [];
      keybindings = mkOptionDefault (
        {
          "${modifier}+Return" = "exec kitty -o allow_remote_control=yes";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = ''exec rofi -show run -run-command "zsh -i -c '{cmd}'"'';
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";
          "${modifier}+e" = "split h";
          "${modifier}+v" = "split v";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";
          "${modifier}+a" = "focus parent";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";
          "${super}+1" = "workspace number 11";
          "${super}+2" = "workspace number 12";
          "${super}+3" = "workspace number 13";
          "${super}+4" = "workspace number 14";
          "${super}+5" = "workspace number 15";
          "${super}+6" = "workspace number 16";
          "${super}+7" = "workspace number 17";
          "${super}+8" = "workspace number 18";
          "${super}+9" = "workspace number 19";
          "${super}+0" = "workspace number 20";
          "${modifier}+Shift+1" = "move container to workspace number 1 ";
          "${modifier}+Shift+2" = "move container to workspace number 2 ";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4 ";
          "${modifier}+Shift+5" = "move container to workspace number 5 ";
          "${modifier}+Shift+6" = "move container to workspace number 6 ";
          "${modifier}+Shift+7" = "move container to workspace number 7 ";
          "${modifier}+Shift+8" = "move container to workspace number 8 ";
          "${modifier}+Shift+9" = "move container to workspace number 9 ";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${super}+Shift+1" = "move container to workspace number 11";
          "${super}+Shift+2" = "move container to workspace number 12";
          "${super}+Shift+3" = "move container to workspace number 13";
          "${super}+Shift+4" = "move container to workspace number 14";
          "${super}+Shift+5" = "move container to workspace number 15";
          "${super}+Shift+6" = "move container to workspace number 16";
          "${super}+Shift+7" = "move container to workspace number 17";
          "${super}+Shift+8" = "move container to workspace number 18";
          "${super}+Shift+9" = "move container to workspace number 19";
          "${super}+Shift+0" = "move container to workspace number 20";
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Shift+e" = "exit";
        }
        // optionalAttrs(!config.settings.vm)
        {
        }
      );
      modes.resize = {
        "h" = "resize shrink width 10 px or 10 ppt";
        "j" = "resize shrink height 10 px or 10 ppt";
        "k" = "resize grow height 10 px or 10 ppt";
        "l" = "resize grow width 10 px or 10 ppt";
        "Escape" = "mode default";
        "Return" = "mode default";
      };
    };
    extraConfig = ''
    '';
  };
}
