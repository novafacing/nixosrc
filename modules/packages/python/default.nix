{ pkgs, ... }:
with (import <nixpkgs> {}); {
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  environment.systemPackages = with pkgs; [
    (python37Full.withPackages(ps: with ps; [
      # nur.repos.angr.python3Packages.angr
      aiohttp
      cryptography
      feedparser
      gmpy
      gmpy2
      i3ipc
      ipython
      netifaces
      numpy
      pip
      power
      psutil
      pwntools
      pycrypto
      pycryptodome
      pygit2
      python-socketio
      requests
      sagemath
      setuptools
      six
      sympy
      tkinter
      urllib3
      pwntools
      ROPGadget
      z3
      # (callPackage ./bumblebee-status { inherit pkgs; })
    ]))
    jython
  ];
}
