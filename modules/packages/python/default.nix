{ pkgs, ... }:
let
  angrPackages = rec {
    ailment = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/ailment { inherit pyvex; };
    angr = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/angr {
      inherit archinfo ailment claripy cle cooldict mulpyplexer pyvex unicorn cppheaderparser;
    };
    archinfo = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/archinfo { };
    claripy = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/claripy { inherit PySMT z3; }; #z3-solver; };
    cle = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/cle { inherit archinfo minidump pyelftools pyvex pyxbe unicorn; };
    cooldict = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/cooldict { };
    minidump = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/minidump { };
    mulpyplexer = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/mulpyplexer { };
    cppheaderparser = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/cppheaderparser { };
    pyelftools = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/pyelftools { };
    pyxbe = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/pyxbe { };
    pyvex = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/pyvex { inherit archinfo unicorn; };
    PySMT = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/pysmt { };
    unicorn = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/unicorn { };
    z3 = pkgs.python38.pkgs.callPackage ./angr/pkgs/python-modules/z3-solver { };
  };
  pygubu = pkgs.python38Packages.buildPythonPackage rec {
    pname = "pygubu";
    version = "0.10.4";
    src = pkgs.python38Packages.fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "02wm5d6xan7rfdgdnjfk5yamf8shjry28sz13vd9h109v0wfn7vz";
    };
    buildInputs = [
      pkgs.python38Packages.tkinter
    ];
  };
  yara = pkgs.python38Packages.buildPythonPackage rec {
    pname = "yara-python";
    version = "4.0.5";
    src = pkgs.python38Packages.fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "1q9rnigrw0r0k3i2v4n2fb27hbkdya7qb9gdaq1nidd7g5wd5i8v";

    };
    doCheck = false;
    buildInputs = [
      pkgs.yara
    ];
  };
  pygubu-designer = pkgs.python38Packages.buildPythonPackage rec {
    pname = "pygubu-designer";
    version = "0.12";
    src = pkgs.python38Packages.fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "1z4d0nwbp8ch5yzhcvj5v09s89c6fga604n7qiyjwikqj0g2ifph";
    };
    doCheck = false;
    preConfigure = ''
      mv ./pygubudesigner/images/mglass_.gif ./pygubudesigner/images/mglass.gif
    '';
    buildInputs = [
      pkgs.python38Packages.tkinter
      pkgs.python38Packages.appdirs
      pygubu
    ];
  };
  python = (pkgs.python38.withPackages(ps: with ps; [
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
    flake8
    flask
    gmpy
    gmpy2
    i3ipc
    ipython
    jedi
    keyring
    lxml
    mypy
    netifaces
    numpy
    pdf2image
    pefile
    pillow
    pip
    poetry
    power
    psutil
    pwntools
    py3to2
    pycryptodome
    pyelftools
    pyfiglet
    pygit2
    pygments
    pygubu
    pygubu-designer
    python-socketio
    pyqt5
    rarfile
    requests
    ropper
    pkgs.sagemath
    scipy
    setuptools
    six
    spotipy
    sympy
    tkinter
    tqdm
    urllib3
    websockets
    yara
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
      ])).override(args: {
        ignoreCollisions = true;
      });
in
  with (import <nixpkgs> {}); {
    environment.systemPackages = with pkgs; [
      (python27.withPackages(ps: with ps; [
        pyelftools
        pygtk
      ]))
      python
      jython
    ];
  }
