{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python38Full.withPackages(ps: with ps; [
      numpy
      pip
      pygit2
      requests
      feedparser
      power
      tkinter
      i3ipc
      psutil
      netifaces
      setuptools
      # (callPackage ./bumblebee-status { inherit pkgs; })
    ]))
  ];
}
