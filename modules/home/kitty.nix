{ config, pkgs, ... }:
let 
  settings = import ../../config/settings.nix;
in
with pkgs.lib; {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 100000;
      font_size = toString settings.fontSize;
      window_border_width = "0.0";
      draw_minimal_borders = false;
      background_opacity = "1.0";
      allow_remote_control = true;
      enable_audio_bell = false;
    };
    extraConfig = ''
      font_family      Fira Code
      bold_font        Fira Code Bold Nerd Font Complete Mono Windows Compatible
      italic_font      Fira Code iCursive S12 Italic Nerd Font Complete Mono Windows Compatible
      bold_italic_font Fira Code iCursive S12 Italic Nerd Font Complete Mono Windows Compatible

      # Colorscheme
      background  #32302f
      foreground  #d4be98
      
      cursor                #d8a657
      
      selection_foreground  #32302f
      selection_background  #d4be98
      
      color0  #32302f
      color8  #d4be98
      
      # red
      color1                #ea6962
      # light red
      color9                #fb4934
      
      # green
      color2                #a9b665
      # light green
      color10               #6c782e
      
      # yellow
      color3                #d8a657
      # light yellow
      color11               #e78a4e
      
      # blue
      color4                #7daea3
      # light blue
      color12               #45707a
      
      # magenta
      color5                #d3869b
      # light magenta
      color13               #945e80
      
      # cyan
      color6                #89b482
      # lighy cyan
      color14               #4c7a5d
      
      # light gray
      color7                #928474
      # dark gray
      color15               #665c54
    '';
  };
}
