{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    my.fira-code-icursive
    fira-code
    fira-code-symbols
    noto-fonts-emoji
  ];
}
