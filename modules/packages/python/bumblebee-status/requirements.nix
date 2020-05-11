# generated using pypi2nix tool (version: 2.0.4)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -e bumblebee-status -r ./full.txt -E libgit2
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python38;
  };

  commonBuildInputs = with pkgs; [ libgit2 ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "bumblebee-status" = python.mkDerivation {
      name = "bumblebee-status-1.10.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/5d/53/de9aa19b40df3e663d848a394f77ad50d2829f7a52395e2f38253905d3e6/bumblebee-status-1.10.3.tar.gz";
        sha256 = "61a414863e9af607b3b91703f7fb44f25ff23db77914e84a42887d602628fabb";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tobi-wan-kenobi/bumblebee-status";
        license = licenses.mit;
        description = "a modular, theme-able status line generator for the i3 window manager.";
      };
    };

    "cached-property" = python.mkDerivation {
      name = "cached-property-1.5.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/57/8e/0698e10350a57d46b3bcfe8eff1d4181642fd1724073336079cb13c5cf7f/cached-property-1.5.1.tar.gz";
        sha256 = "9217a59f14a5682da7c4b8829deadbfc194ac22e9908ccf7c8820234e80a1504";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pydanny/cached-property";
        license = licenses.bsdOriginal;
        description = "A decorator for caching properties in classes.";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2020.4.5.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b8/e2/a3a86a67c3fc8249ed305fc7b7d290ebe5e4d46ad45573884761ef4dea7b/certifi-2020.4.5.1.tar.gz";
        sha256 = "51fcb31174be6e6664c5f69e3e1691a2d72a1a12e90f872cbdb1567eb47b6519";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://certifiio.readthedocs.io/en/latest/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "cffi" = python.mkDerivation {
      name = "cffi-1.14.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/05/54/3324b0c46340c31b909fcec598696aaec7ddc8c18a63f2db352562d3354c/cffi-1.14.0.tar.gz";
        sha256 = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ 
        pkgs.libffi
      ];
      propagatedBuildInputs = [
        self."pycparser"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz";
        sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "docker" = python.mkDerivation {
      name = "docker-4.2.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/96/62/cd321bff4c55532e46f2824df8981fba9ac793d148d410bbdd4b8a98bd3c/docker-4.2.0.tar.gz";
        sha256 = "ddae66620ab5f4bce769f64bcd7934f880c8abe6aa50986298db56735d0f722e";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."requests"
        self."six"
        self."websocket-client"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/docker/docker-py";
        license = licenses.asl20;
        description = "A Python library for the Docker Engine API.";
      };
    };

    "feedparser" = python.mkDerivation {
      name = "feedparser-5.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/91/d8/7d37fec71ff7c9dbcdd80d2b48bcdd86d6af502156fc93846fb0102cb2c4/feedparser-5.2.1.tar.bz2";
        sha256 = "ce875495c90ebd74b179855449040003a1beb40cd13d5f037a0654251e260b02";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kurtmckee/feedparser";
        license = "License :: OSI Approved";
        description = "Universal feed parser, handles RSS 0.9x, RSS 1.0, RSS 2.0, CDF, Atom 0.3, and Atom 1.0 feeds";
      };
    };

    "hddtemp" = python.mkDerivation {
      name = "hddtemp-0.1.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/a5/93/7b6eb8ca950e685b4bd0dc85e27a1135d99f1a49d426d2572d43184767a6/hddtemp-0.1.0.tar.gz";
        sha256 = "0fd485be04793ae6aea7f7f3824ab095a85ace686c86b19605307577f9b51b4e";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "UNKNOWN";
        license = licenses.gpl3Plus;
        description = "An hddtemp client";
      };
    };

    "i3ipc" = python.mkDerivation {
      name = "i3ipc-2.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/61/f3/dfab70c888d85d3e933ff4d6b351aaed0ae137a29c896e03e364de3bec94/i3ipc-2.2.1.tar.gz";
        sha256 = "e880d7d7147959ead5cb34764f08b97b41385b36eb8256e8af1ce163dbcccce8";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."python-xlib"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/altdesktop/i3ipc-python";
        license = licenses.bsdOriginal;
        description = "An improved Python library to control i3wm and sway";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.9";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cb/19/57503b5de719ee45e83472f339f617b0c01ad75cba44aba1e4c97c2b0abd/idna-2.9.tar.gz";
        sha256 = "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "kitchen" = python.mkDerivation {
      name = "kitchen-1.2.6";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d9/ca/3365cb1160533be8c8b57dbfd6502f367d35e30935ee89a003c664740714/kitchen-1.2.6.tar.gz";
        sha256 = "b84cf582f1bd1556b60ebc7370b9d331eb9247b6b070ce89dfe959cba2c0b03c";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://fedorahosted.org/kitchen";
        license = licenses.lgpl2;
        description = "Kitchen contains a cornucopia of useful code";
      };
    };

    "netifaces" = python.mkDerivation {
      name = "netifaces-0.10.9";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/0d/18/fd6e9c71a35b67a73160ec80a49da63d1eed2d2055054cc2995714949132/netifaces-0.10.9.tar.gz";
        sha256 = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/al45tair/netifaces";
        license = licenses.mit;
        description = "Portable network interface information.";
      };
    };

    "psutil" = python.mkDerivation {
      name = "psutil-5.7.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41/psutil-5.7.0.tar.gz";
        sha256 = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/giampaolo/psutil";
        license = licenses.bsdOriginal;
        description = "Cross-platform lib for process and system monitoring in Python.";
      };
    };

    "pycparser" = python.mkDerivation {
      name = "pycparser-2.20";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz";
        sha256 = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };

    "pygit2" = python.mkDerivation {
      name = "pygit2-1.2.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d0/c6/33e2df5722e3adf49adc6a2d3c2cdb5a5247236fd8f2063a0c4d058116a1/pygit2-1.2.1.tar.gz";
        sha256 = "de9421118a99c79cbba1e512d60e5caed1d63273ce30a0e8d4edef4a2e500387";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."cached-property"
        self."cffi"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/libgit2/pygit2";
        license = "GPLv2 with linking exception";
        description = "Python bindings for libgit2.";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.8.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz";
        sha256 = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c";
};
      doCheck = commonDoCheck;
      format = "pyproject";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };

    "python-xlib" = python.mkDerivation {
      name = "python-xlib-0.27";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/e8/fa/a61ef33df117de4c57d11b4ba0b624f5352f21aa2e1eda404860155e8855/python-xlib-0.27.tar.bz2";
        sha256 = "a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-xlib/python-xlib";
        license = licenses.lgpl2Plus;
        description = "Python X Library";
      };
    };

    "pytz" = python.mkDerivation {
      name = "pytz-2020.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/f4/f6/94fee50f4d54f58637d4b9987a1b862aeb6cd969e73623e02c5c00755577/pytz-2020.1.tar.gz";
        sha256 = "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.23.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915/requests-2.23.0.tar.gz";
        sha256 = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."certifi"
        self."chardet"
        self."idna"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://requests.readthedocs.io";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "setuptools" = python.mkDerivation {
      name = "setuptools-46.1.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b5/96/af1686ea8c1e503f4a81223d4a3410e7587fd52df03083de24161d0df7d4/setuptools-46.1.3.zip";
        sha256 = "795e0475ba6cd7fa082b1ee6e90d552209995627a2a227a47c6ea93282f4bfb1";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools";
        license = licenses.mit;
        description = "Easily download, build, install, upgrade, and uninstall Python packages";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.14.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/21/9f/b251f7f8a76dec1d6651be194dfba8fb8d7781d10ab3987190de8391d08e/six-1.14.0.tar.gz";
        sha256 = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "suntime" = python.mkDerivation {
      name = "suntime-1.2.5";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ee/0a/3c8cf603700e2d9987ce5dcf06845fbf889eaa1b781f6b7b028773e3b765/suntime-1.2.5.tar.gz";
        sha256 = "e4df651dfcde332f905e57da6be49a1cc696499f11853fb0395df29104274649";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."python-dateutil"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/SatAgro/suntime";
        license = "LGPLv3";
        description = "Simple sunset and sunrise time calculation python library";
      };
    };

    "taskw" = python.mkDerivation {
      name = "taskw-1.2.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/30/1f/610321b369698278f7586e557387c8f27515097fb5511b30294eb6463e98/taskw-1.2.0.tar.gz";
        sha256 = "fadd8afc12df026c3c2d39b633c55d3337f7dca95602fce2239455a048bc85fe";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."kitchen"
        self."python-dateutil"
        self."pytz"
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ralphbean/taskw";
        license = licenses.gpl1;
        description = "Python bindings for your taskwarrior database";
      };
    };

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.25.9";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36/urllib3-1.25.9.tar.gz";
        sha256 = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

    "websocket-client" = python.mkDerivation {
      name = "websocket-client-0.57.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/8b/0f/52de51b9b450ed52694208ab952d5af6ebbcbce7f166a48784095d930d8c/websocket_client-0.57.0.tar.gz";
        sha256 = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/websocket-client/websocket-client.git";
        license = licenses.bsdOriginal;
        description = "WebSocket client for Python. hybi13 is supported.";
      };
    };

    "wheel" = python.mkDerivation {
      name = "wheel-0.34.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/75/28/521c6dc7fef23a68368efefdcd682f5b3d1d58c2b90b06dc1d0b805b51ae/wheel-0.34.2.tar.gz";
        sha256 = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
      ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/wheel";
        license = licenses.mit;
        description = "A built-package format for Python";
      };
    };

    "yubico" = python.mkDerivation {
      name = "yubico-1.6.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/43/1e/34093ca0f3d956cfb26cc59d42de9dab14547ec497d43fb7cf2669ca1034/yubico-1.6.2.tar.gz";
        sha256 = "4274650d26aa821f435df3b7c0cfc3a043240f9304dfda0def0a8ce91c83f380";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."requests"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Kami/python-yubico-client/";
        license = licenses.bsdOriginal;
        description = "Python Yubico Client";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (let src = pkgs.fetchFromGitHub { owner = "nix-community"; repo = "pypi2nix-overrides"; rev = "100c15ec7dfe7d241402ecfb1e796328d0eaf1ec"; sha256 = "0akfkvdakcdxc1lrxznh1rz2811x4pafnsq3jnyr5pn3m30pc7db"; } ; in import "${src}/overrides.nix" { inherit pkgs python; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )