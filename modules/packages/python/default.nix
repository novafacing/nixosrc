{ pkgs, ... }:
with (import <nixpkgs> {}); {
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  environment.systemPackages = with pkgs; [
    (python37Full.withPackages(ps: with ps; [
      nur.repos.angr.python3Packages.angr
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
      pwntools
      ipython
      aiohttp
      python-socketio
      # (callPackage ./bumblebee-status { inherit pkgs; })
    ]))
    jython
  ];
}
