{ config, lib, pkgs, fetchurl, ... }:

let
  mod = "Mod1";
  sup = "Mod4";
  github_token = lib.removeSuffix "\n" (builtins.readFile ../../nixos-private/github_token_bumblebee_status);
  settings = import ../../config/settings.nix;
in
  with pkgs; {
  # These are the home-manager configs for X/i3
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps; ## (callPackage ./i3-round.nix {}); for rounded
    config = {
      fonts = [
         "Fira Code Medium 12" 
      ];
      modifier = mod;
      bars = [
        {
          position = "top";
          statusCommand = ''bumblebee-status -t gruvbox-powerline -m spacer spacer spacer git github pomodoro cpu memory disk:root disk:home traffic weather battery datetime -p interval=10 root.path=/ home.path=/home battery.showpowerconsumption=true battery.showremaining=true github.token=${github_token} weather.location=Cincinnati weather.showminmax=true pulseaudio.autostart=true pulseaudio.percent_change=5 pulseaudio.showbars=1 spacer.theme.bg=#504945 spacer.text="                                                                                                                                                                "'';
        }
      ];
      gaps = {
        inner = 20;
        outer = 10;
        smartGaps = true;
      };
      colors = {
        background = "#504945";
        focused = {
          border = "#504945";
          background = "#504945";
          text = "#504945";
          indicator = "#504945";
          childBorder = "#504945";
        };
        unfocused = {
          border = "#504945";
          background = "#504945";
          text = "#504945";
          indicator = "#504945";
          childBorder = "#504945";
        };
      };
      window = {
        titlebar = false;
        border = 0;
        hideEdgeBorders = "none";
      };
      floating = {
        modifier = "${mod}";
        criteria = [
          { "title" = "gcolor3"; }
        ];
      };
      focus = {
        forceWrapping = true;
        followMouse = true;
      };
      keybindings = lib.mkOptionDefault (
        {
          "${mod}+Return" = "exec kitty -o allow_remote_control=yes";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = ''exec rofi -show run -run-command "zsh -i -c '{cmd}'"'';
          "${sup}+c" = ''CM_ONESHOT=1 clipmenud'';
          "${sup}+v" = ''exec clipmenu'';
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+m" = "floating toggle";
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
          "XF86AudioRaiseVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ +10%";
          "XF86AudioLowerVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ -10%";
          "XF86AudioMute" =  "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86MonBrightnessUp" = ''exec brightnessctl set "+5%"''; # increase screen brightness
          "XF86MonBrightnessDown" = ''exec brightnessctl set "5%-"''; # decrease screen brightness
        }
        );
        modes.resize = {
          "l" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize shrink height 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "h" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
        startup = [
          {
            command = "feh --bg-scale /etc/nixos/theme/wallpaper.png";
            always = true;
            notification = false;
          }
          {
            command = "twmnd";
            always = true;
            notification = false;
          }
        ];
      };
      extraConfig = ''
        new_window none
        new_float none
        for_window [class="^(?|feh$)"] border pixel 0
        bindsym --release ${mod}+g exec "maim -s | tee ~/hub/screenshots/$(date '+%Y-%m-%d_%H-%M-%S')_screenshot.png | xclip -selection clipboard -t image/png -i"
      '';
    };
  }
