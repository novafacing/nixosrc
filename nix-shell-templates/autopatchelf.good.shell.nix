with import <nixpkgs> {};
let
  libs = lib.makeLibraryPath [ glibc ];
in
mkShell {
  hardeningDisable = [
    "format"
  ];
  shellHook = ''
    export hardeningDisable=format;
    export libs=${libs};
  '';
  nativeBuildInputs = with buildPackages; [
    glibc
  ];
}
