{ pkgs, ... }:
let
  angrPackages = rec {
    ailment = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/ailment { inherit pyvex; };
    angr = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/angr {
      inherit archinfo ailment claripy cle cooldict mulpyplexer pyvex unicorn cppheaderparser;
    };
    archinfo = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/archinfo { };
    claripy = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/claripy { inherit PySMT z3; }; #z3-solver; };
    cle = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/cle { inherit archinfo minidump pyelftools pyvex pyxbe unicorn; };
    cooldict = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/cooldict { };
    minidump = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/minidump { };
    mulpyplexer = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/mulpyplexer { };
    cppheaderparser = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/cppheaderparser { };
    pyelftools = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/pyelftools { };
    pyxbe = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/pyxbe { };
    pyvex = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/pyvex { inherit archinfo unicorn; };
    PySMT = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/pysmt { };
    unicorn = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/unicorn { };
    z3 = pkgs.python37.pkgs.callPackage ./angr/pkgs/python-modules/z3-solver { };
  };
  pygubu = pkgs.python37Packages.buildPythonPackage rec {
    pname = "pygubu";
    version = "0.10.4";
    src = pkgs.python37Packages.fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "02wm5d6xan7rfdgdnjfk5yamf8shjry28sz13vd9h109v0wfn7vz";
    };
    buildInputs = [
      pkgs.python37Packages.tkinter
    ];
  };
  pygubu-designer = pkgs.python37Packages.buildPythonPackage rec {
    pname = "pygubu-designer";
    version = "0.12";
    src = pkgs.python37Packages.fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "1z4d0nwbp8ch5yzhcvj5v09s89c6fga604n7qiyjwikqj0g2ifph";
    };
    doCheck = false;
    preConfigure = ''
      mv ./pygubudesigner/images/mglass_.gif ./pygubudesigner/images/mglass.gif
    '';
    buildInputs = [
      pkgs.python37Packages.tkinter
      pkgs.python37Packages.appdirs
      pygubu
    ];
  };
in
  with (import <nixpkgs> {}); {
    environment.systemPackages = with pkgs; [
      (python27.withPackages(ps: with ps; [
        pyelftools
        pygtk
      ]))
      (python37.withPackages(ps: with ps; [
        ROPGadget
        aiohttp
        beautifulsoup4
        binwalk
        black
        colour
        construct
        cryptography
        cssselect
        feedparser
        filebytes
        flask
        gmpy
        gmpy2
        i3ipc
        ipython
        jedi
        keyring
        libiio
        lxml
        netifaces
        numpy
        pdf2image
        pillow
        pip
        power
        psutil
        pwntools
        py3to2
        pycrypto
        pycryptodome
        pyelftools
        pyfiglet
        pygit2
        pygments
        pygubu
        pygubu-designer
        python-socketio
        rarfile
        requests
        ropper
        sagemath
        scipy
        setuptools
        six
        sympy
        tkinter
        urllib3
        websockets
        z3
        # angrPackages.ailment
        # angrPackages.angr
        # angrPackages.archinfo
        # angrPackages.claripy
        # angrPackages.cle
        # angrPackages.cooldict
        # angrPackages.minidump
        # angrPackages.mulpyplexer
        # angrPackages.cppheaderparser
        # angrPackages.pyelftools
        # angrPackages.pyxbe
        # angrPackages.pyvex
        # angrPackages.PySMT
        # angrPackages.unicorn
        # angrPackages.z3
      ]))
      jython
    ];
  }
