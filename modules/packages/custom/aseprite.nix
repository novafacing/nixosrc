{ stdenv, pkgs, lib, callPackage, fetchurl, libxcb, libGL, fontconfig, libX11, libXext, libXcursor, expat, freetype, giflib, libjpeg, libpng, libwebp, pixman, tinyxml, libXxf86vm, saneBackends }:
stdenv.mkDerivation rec {
  name = "aseprite-${version}";
  version = "1.2.21";

  #src = fetchurl {
  #  url = "http://rowanbhart.net/files/Aseprite_1.2.21-1_amd64.deb";
  #  sha256 = "6442edbe6b448adc1eaa561e30f92154c2c420e6e65cec3d8ba59ee418aeb5e6";
  #};
  src = /etc/nixos/nixos-private/Aseprite_1.2.21-1_amd64.deb;

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

  meta = with stdenv.lib; {
    homepage = "https://aseprite.org";
    description = "Animated Sprite Editor & Pixel Art Tool";
    license = licenses.unfree;
    platforms = platforms.linux;
    maintainers = novafacing;
  };
}
