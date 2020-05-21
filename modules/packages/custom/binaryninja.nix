{ stdenv, glib, libglvnd, xlibs, fontconfig, dbus, fetchzip, autoPatchelfHook }:

stdenv.mkDerivation {
  name = "binaryninja";

  src = fetchzip {
    url = "file:";
    sha256 = "1yq3as1mw681zh1if2nkxc7677lwqca82vhacb267hh8j91svjf4";
  };

  installPhase = ''
    mkdir -p $out/share/binary-ninja
    cp -r * $out/share/binary-ninja
  '';

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [
    stdenv.cc.cc
    glib
    fontconfig
    dbus
    libglvnd
    xlibs.libX11
    xlibs.libXi
    xlibs.libXrender
  ];
}
