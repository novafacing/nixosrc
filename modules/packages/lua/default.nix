{pkgs, lib, stdenv, fetchurl, fetchgit, fetchzip, lua52Packages, ... }:
let
  date = lua52Packages.buildLuarocksPackage {
    pname = "date";
    version = "2.1.2-1";

    src = fetchurl {
      url    = https://luarocks.org/date-2.1.2-1.src.rock;
      sha256 = "05z80yxx5rdmjbg2gk4f3iywscs2777m21b6n4iapwravzzn57k3";
    };
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "https://github.com/Tieske/date";
      description = "Date & Time module for Lua 5.x";
      license.fullName = "MIT";
    };
  };
  etlua = lua52Packages.buildLuarocksPackage {
    pname = "etlua";
    version = "1.3.0-1";

    src = fetchurl {
      url    = https://luarocks.org/etlua-1.3.0-1.src.rock;
      sha256 = "029710wg0viwf57f97sqwjqrllcbj8a4igj31rljkiisyf36y6ka";
    };
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "https://github.com/leafo/etlua";
      description = "Embedded templates for Lua";
      license.fullName = "MIT";
    };
  };
  loadkit = lua52Packages.buildLuarocksPackage {
    pname = "loadkit";
    version = "1.1.0-1";

    src = fetchurl {
      url    = https://luarocks.org/loadkit-1.1.0-1.src.rock;
      sha256 = "1jxwzsjdhiahv6qdkl076h8xf0lmypibh71bz6slqckqiaq1qqva";
    };
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "https://github.com/leafo/loadkit";
      description = "Loadkit allows you to load arbitrary files within the Lua package path";
      license.fullName = "MIT";
    };
  };
  lpeg = lua52Packages.buildLuarocksPackage {
    pname = "lpeg";
    version = "1.0.2-1";

    src = fetchurl {
      url    = https://luarocks.org/lpeg-1.0.2-1.src.rock;
      sha256 = "1g5zmfh0x7drc6mg2n0vvlga2hdc08cyp3hnb22mh1kzi63xdl70";
    };
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://www.inf.puc-rio.br/~roberto/lpeg.html";
      description = "Parsing Expression Grammars For Lua";
      license.fullName = "MIT/X11";
    };
  };
  lua-cjson = lua52Packages.buildLuarocksPackage {
    pname = "lua-cjson";
    version = "2.1.0-1";

    knownRockspec = (fetchurl {
      url    = https://luarocks.org/manifests/openresty/lua-cjson-2.1.0-1.rockspec;
      sha256 = "2ffe98a27d9e93a36711e89f032deab274f670c081f0875a0a055ebb7fb596fb";
    }).outPath;

    src = fetchzip {
      stripRoot = true;
      url = http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.zip;
      sha256 = "0d6zcpqrb0pjmnbfxkk1m1s63wpjjbwgkzndv4f3xczgysxpvi2a";
      extraPostFetch = ''
        chmod go-w $out
      '';
    };

    dontStrip = true;
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://www.kyne.com.au/~mark/software/lua-cjson.php";
      description = "A fast JSON encoding/parsing module";
      license.fullName = "MIT";
    };
  };
  luaossl = lua52Packages.buildLuarocksPackage {
    pname = "luaossl";
    version = "20200709-0";

    dontStrip = true;
    src = fetchurl {
      url    = https://luarocks.org/luaossl-20200709-0.src.rock;
      sha256 = "0y6dqf560j2bq2rjlm5572m82pj627fd2p9mjc5y6fbram764vga";
    };
    buildInputs = with pkgs; [ openssl.dev ];
    propagatedBuildInputs = with pkgs; [ lua openssl.dev ];
    extraVariables = {
      # Dev propagates out
      CRYPTO_DIR = "${pkgs.openssl.dev}";
      OPENSSL_INCDIR = "${pkgs.openssl.dev}/include";
      # Out has libs
      CRYPTO_LIBDIR = "${pkgs.openssl.dev.out}/lib";
      OPENSSL_LIBDIR = "${pkgs.openssl.dev.out}/lib";
    };

    meta = with lib; {
      homepage = "http://25thandclement.com/~william/projects/luaossl.html";
      description = "Most comprehensive OpenSSL module in the Lua universe.";
      license.fullName = "MIT/X11";
    };
  };
  mimetypes = lua52Packages.buildLuarocksPackage {
    pname = "mimetypes";
    version = "1.0.0-2";

    src = fetchurl {
      url    = https://luarocks.org/mimetypes-1.0.0-2.src.rock;
      sha256 = "179yzsiqc494xpzsz6w9m2iqw9pis8p0xbi3rcz6arc23i842swp";
    };
    propagatedBuildInputs = with pkgs; [ lua ];
    dontStrip = true;

    meta = with lib; {
      homepage = "https://bitbucket.org/leafstorm/lua-mimetypes/";
      description = "A simple library for looking up the MIME types of files.";
      license.fullName = "MIT/X11";
    };
  };
  luabitop = lua52Packages.buildLuarocksPackage {
    pname = "luabitop";
    version = "1.0.2-3";

    knownRockspec = (fetchurl {
      url    = https://luarocks.org/manifests/novafacing/luabitop-1.0.2-3.rockspec;
      sha256 = "05jy25ay8h6yp3kz1jai99v5c9k25qyybn12h7pz8gs5k9jsd1br";
    }).outPath;

    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
      "url": "git://github.com/LuaDist/luabitop.git",
      "rev": "81bb23b0e737805442033525de8e6d204d0e5281",
      "sha256": "0lsc556hlkddjbmcdbg7wc2g55bfy743p8ywdzl8x7kk847r043q",
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
      }
    '') ["date"]) ;

    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://bitop.luajit.org/";
      description = "Lua Bit Operations Module";
      license.fullName = "MIT/X license";
    };
  };
in
let
  pgmoon = lua52Packages.buildLuarocksPackage {
    pname = "pgmoon";
    version = "1.11.0-1";

    src = fetchurl {
      url    = https://luarocks.org/pgmoon-1.11.0-1.src.rock;
      sha256 = "0nw7q890mwjqbj84azgjqk9rpdnfpyhfn06hkzxv8hz3qs8spa05";
    };
    propagatedBuildInputs = with pkgs; [ lua luabitop lpeg openssl.dev ];

    meta = with lib; {
      homepage = "https://github.com/leafo/pgmoon";
      description = "Postgres driver for OpenResty and Lua";
      license.fullName = "MIT";
    };
  };
in
  {
    lapis = lua52Packages.buildLuarocksPackage {
      pname = "lapis";
      name = "lapis";
      version = "1.8.1-1";

      src = fetchurl {
        url    = https://luarocks.org/lapis-1.8.1-1.src.rock;
        sha256 = "16gbmafya7wjym4ybxlhfy25xshm89xw610kx9f89ag4xckw91l9";
      };

      propagatedBuildInputs = with pkgs; with lua52Packages; [ lua ansicolors date etlua loadkit lpeg lua-cjson luaossl luafilesystem luasocket mimetypes pgmoon ];

      meta = with lib; {
        homepage = "http://leafo.net/lapis";
        description = "A web framework for MoonScript & Lua";
        license.fullName = "MIT";
      };
    };
  }
