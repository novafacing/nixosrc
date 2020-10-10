{ stdenv, autoPatchelfHook, makeWrapper, fetchurl, unzip, libGL, glib, fontconfig, xorg, xlibs, dbus, xkeyboard_config, libxkbcommon, kerberos, nspr, alsaLib, nss, qt512}:
stdenv.mkDerivation rec {
  name = "binaryninja";
  buildInputs = [ autoPatchelfHook makeWrapper unzip libGL stdenv.cc.cc.lib glib fontconfig xorg.libxcb xlibs.xcbutilwm xlibs.xcbutilkeysyms xlibs.xcbutilrenderutil xlibs.libXi xlibs.libXrender dbus libxkbcommon xlibs.xcbutilimage kerberos nspr xlibs.libXcomposite xlibs.libXdamage xlibs.libXcursor xlibs.libXtst xlibs.libXrandr alsaLib nss qt512.qtwebkit];
  #src = fetchurl {
  #  url = "http://rowanbhart.net/files/BinaryNinja-personal.zip";
  #  sha256 = "5dae72ad0d31f7439cf4232a5324a31857ce4e0e593c85c62520c94ff171b4a2";
  #};
  src = /etc/nixos/nixos-private/BinaryNinja-personal-dev.zip;

  buildPhase = ":";
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/opt
    cp -r * $out/opt
    chmod +x $out/opt/binaryninja
    makeWrapper $out/opt/binaryninja \
          $out/bin/binaryninja \
          --prefix "QT_XKB_CONFIG_ROOT" ":" "${xkeyboard_config}/share/X11/xkb"
  '';
}
