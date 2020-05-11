{pkgs, stdenv, fetchurl, autoreconfHook, i3}:

pkgs.i3.overrideAttrs(old: rec {
    version = "4.16.2";
    name = "i3-round-${version}";
    src = fetchurl {
      url = "https://github.com/novafacing/i3/archive/${version}.tar.gz";
      sha256 = "0sbairdpsgyxbc932vs9npx6jgqck41yrjbrpgks002vi104s4ma";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [ autoreconfHook ];
    enableParallelBuilding = false;
    meta = with stdenv.lib; {
      description = "A fork of the fork of the i3 tiling window manager that supports rounded borders";
      maintainers = with maintainers; [ resloved ];
      license = licenses.bsd3;
      platforms = platforms.all;
    };
})
