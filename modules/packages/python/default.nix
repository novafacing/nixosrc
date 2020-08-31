{ pkgs, ... }:
let
  angrPackages = rec {
    ailment = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/ailment { inherit pyvex; };
    angr = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/angr {
      inherit archinfo ailment claripy cle cooldict mulpyplexer pyvex unicorn cppheaderparser;
    };
    archinfo = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/archinfo { };
    claripy = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/claripy { inherit PySMT z3; }; #z3-solver; };
    cle = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/cle { inherit archinfo minidump pyelftools pyvex pyxbe unicorn; };
    cooldict = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/cooldict { };
    minidump = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/minidump { };
    mulpyplexer = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/mulpyplexer { };
    cppheaderparser = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/cppheaderparser { };
    pyelftools = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/pyelftools { };
    pyxbe = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/pyxbe { };
    pyvex = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/pyvex { inherit archinfo unicorn; };
    PySMT = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/pysmt { };
    unicorn = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/unicorn { };
    z3 = pkgs.python37Full.pkgs.callPackage ./angr/pkgs/python-modules/z3-solver { };
  };
in
  with (import <nixpkgs> {}); {
    environment.systemPackages = with pkgs; [
      (python37.withPackages(ps: with ps; [
        angrPackages.angr
        ROPGadget
        beautifulsoup4
        aiohttp
        pygments
        cryptography
        feedparser
        gmpy
        gmpy2
        flask
        i3ipc
        ipython
        netifaces
        numpy
        pillow
        pip
        power
        psutil
        pwntools
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
      ]))
      jython
    ];
  }
