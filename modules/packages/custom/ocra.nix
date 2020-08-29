{pkgs, stdenv, fetchurl}:
let   
  version = "0.0.1";
in stdenv.mkDerivation {    
  name = "ocra";
  src = fetchurl {
    url = "https://github.com/novafacing/ocra/releases/download/${version}/ocra.zip";
    sha256 = "12zdpbz1ccivp59xw19fdh3m22hmpnl3wlkc5mf255jdm9xb0wlq";
  };
  sourceRoot = ".";
  unpackCmd = "unzip ocra.zip";
  dontConfigure = true;
  dontBuild = true;
  buildInputs = with pkgs; [ 
    unzip 
  ];
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    ls -lah
    cp -r ocra/* $out/share/fonts/truetype
  '';
}
