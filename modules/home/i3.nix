{ config, pkgs, ... }:

let
  mod = "Mod1";
  sup = "Mod4";
in
with pkgs.lib; {

  # These are the home-manager configs for X
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      bars = [];
      keybindings = mkOptionDefault (
        {
          "${mod}+Return" = "exec kitty -o allow_remote_control=yes";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = ''exec rofi -show run -run-command "zsh -i -c '{cmd}'"'';
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";
          "${mod}+e" = "split h";
          "${mod}+v" = "split v";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+a" = "focus parent";
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";
          "${sup}+1" = "workspace number 11";
          "${sup}+2" = "workspace number 12";
          "${sup}+3" = "workspace number 13";
          "${sup}+4" = "workspace number 14";
          "${sup}+5" = "workspace number 15";
          "${sup}+6" = "workspace number 16";
          "${sup}+7" = "workspace number 17";
          "${sup}+8" = "workspace number 18";
          "${sup}+9" = "workspace number 19";
          "${sup}+0" = "workspace number 20";
          "${mod}+Shift+1" = "move container to workspace number 1 ";
          "${mod}+Shift+2" = "move container to workspace number 2 ";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4 ";
          "${mod}+Shift+5" = "move container to workspace number 5 ";
          "${mod}+Shift+6" = "move container to workspace number 6 ";
          "${mod}+Shift+7" = "move container to workspace number 7 ";
          "${mod}+Shift+8" = "move container to workspace number 8 ";
          "${mod}+Shift+9" = "move container to workspace number 9 ";
          "${mod}+Shift+0" = "move container to workspace number 10";
          "${sup}+Shift+1" = "move container to workspace number 11";
          "${sup}+Shift+2" = "move container to workspace number 12";
          "${sup}+Shift+3" = "move container to workspace number 13";
          "${sup}+Shift+4" = "move container to workspace number 14";
          "${sup}+Shift+5" = "move container to workspace number 15";
          "${sup}+Shift+6" = "move container to workspace number 16";
          "${sup}+Shift+7" = "move container to workspace number 17";
          "${sup}+Shift+8" = "move container to workspace number 18";
          "${sup}+Shift+9" = "move container to workspace number 19";
          "${sup}+Shift+0" = "move container to workspace number 20";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+e" = "exit";
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
