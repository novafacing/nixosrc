{ stdenv
, fetchzip
, fetchurl
, lib
, makeWrapper
, autoPatchelfHook
, openjdk11
, pam
, makeDesktopItem
, icoutils
}:

let

  pkg_path = "$out/lib/ghidra";

  desktopItem = makeDesktopItem {
    name = "ghidra";
    exec = "ghidra";
    icon = "ghidra";
    desktopName = "Ghidra";
    genericName = "Ghidra Software Reverse Engineering Suite";
    categories = "Development;";
  };

in stdenv.mkDerivation rec {

  pname = "ghidra";
  version = "9.2.2";
  versiondate = "20201229";

  src = fetchzip {
    url = "https://www.ghidra-sre.org/ghidra_${version}_PUBLIC_${versiondate}.zip";
    sha256 = "1xahkwiqdcwxssah16hhgrmyam49cb341xp5ysycj1h0kkm8p53s";
  };

  plugin = fetchurl {
    url = "https://github.com/Gekkio/GhidraBoy/releases/download/20210120_ghidra_9.2.2/ghidra_9.2.2_PUBLIC_20210120_GhidraBoy.zip";
    sha256 = "118978pb9n1j1s7pxblbhcd7ih626dfzs8frvijqsn4nhvckbssa";
  };

  nativeBuildInputs = [
    makeWrapper
    icoutils
  ]
  ++ lib.optionals stdenv.isLinux [ autoPatchelfHook ];

  buildInputs = [
    stdenv.cc.cc.lib
    pam
  ];

  dontStrip = true;

  installPhase = ''
    mkdir -p "${pkg_path}"
    mkdir -p "${pkg_path}" "$out/share/applications"
    cp -a * "${pkg_path}"
    ln -s ${desktopItem}/share/applications/* $out/share/applications
    icotool -x "${pkg_path}/support/ghidra.ico"
    rm ghidra_4_40x40x32.png
    for f in ghidra_*.png; do
      res=$(basename "$f" ".png" | cut -d"_" -f3 | cut -d"x" -f1-2)
      mkdir -pv "$out/share/icons/hicolor/$res/apps"
      mv "$f" "$out/share/icons/hicolor/$res/apps/ghidra.png"
    done;
    cp "${plugin}" "${pkg_path}/Extensions/Ghidra/"
  '';

  postFixup = ''
    mkdir -p "$out/bin"
    makeWrapper "${pkg_path}/ghidraRun" "$out/bin/ghidra" \
      --prefix PATH : ${lib.makeBinPath [ openjdk11 ]}

  '';

  meta = with lib; {
    description = "A software reverse engineering (SRE) suite of tools developed by NSA's Research Directorate in support of the Cybersecurity mission";
    homepage = "https://ghidra-sre.org/";
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    license = licenses.asl20;
    maintainers = with maintainers; [ ck3d govanify ];
  };

}
