{ stdenv, pkgs, lib, callPackage, fetchurl, libxcb, libGL, fontconfig, libX11, libXext, libXcursor, expat, freetype, giflib, libjpeg, libpng, libwebp, pixman, tinyxml, libXxf86vm, saneBackends }:
stdenv.mkDerivation rec {
  name = "aseprite-${version}";
  version = "1.2.25";

  src = /etc/nixos/nixos-private/Aseprite_1.2.25-1_amd64.deb;

  sourceRoot = ".";
  unpackPhase = "dpkg-deb -x $src .";

  nativeBuildInputs = [
    pkgs.dpkg
  ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    rm -rf $out/bin/ $out/usr/share/ $out/usr/bin/
    mkdir -p $out/bin/
    mkdir -p $out/usr/bin/
    mkdir -p $out/usr/share/
    cp -R usr/share/* $out/usr/share/
    cp -R usr/bin/* $out/usr/bin/
    ln -s $out/usr/bin/aseprite $out/bin/aseprite
    chmod +wx $out/bin/aseprite
  '';

  preFixup = let
    libPath = lib.makeLibraryPath [
      libxcb
      libGL
      libX11
      libXext
      libXcursor
      expat
      freetype
      giflib
      libjpeg
      libpng
      libwebp
      pixman
      tinyxml
      libXxf86vm
      fontconfig
      saneBackends
    ];
  in ''
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath "${libPath}" \
      $out/usr/bin/aseprite
  '';

  meta = with lib; {
    homepage = "https://aseprite.org";
    description = "Animated Sprite Editor & Pixel Art Tool";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = novafacing;
  };
}
