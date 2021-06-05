{pkgs, stdenv, fetchurl}:
let 
  version = "1.0.1";
in stdenv.mkDerivation {
    name = "fira-code-icursive";
    src = fetchurl {
      url = "https://github.com/novafacing/fira-code-iscript/releases/download/${version}/Fira.Code.iCursive.S12.zip";
      sha256 = "0fbnhdipaknsxvxa803gdvxsy38z728pzws7x8kmd2zqih1w1sa3";
    };
    sourceRoot = ".";
    unpackCmd = "unzip Fira.Code.iCursive.S12.zip";
    dontConfigure = true;
    dontBuild = true;
    buildInputs = with pkgs; [ 
      unzip 
    ];
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      ls -lah
      cp -r Fira\ Code\ iCursive\ S12/ $out/share/fonts/truetype
    '';
  }
