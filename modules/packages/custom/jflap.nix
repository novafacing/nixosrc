{ stdenv, pkgs, jre8, makeWrapper, fetchurl, wrapGAppsHook }:

stdenv.mkDerivation {
  name = "JFLAP";
  src = fetchurl {
    url = http://www.jflap.org/jflaptmp/july27-18/JFLAP7.1.jar;
    sha256 = "01llr436w5h5c6wldsrm1xbwn11sbcbfzvpbx1iq3canvifhjb52";
  };

  unpackPhase = ":";

  buildInputs = [ jre8 makeWrapper wrapGAppsHook ];

  installPhase =
    ''
      mkdir -p $out/bin
      mkdir -p $out/share/java
      cp $src $out/share/java/jflap.jar
      makeWrapper ${jre8}/bin/java $out/bin/jflap \
        --add-flags "-jar $out/share/java/jflap.jar"
    '';
}
