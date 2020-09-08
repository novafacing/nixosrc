{ pkgs ? import <nixpkgs> {} }:
let
  libpath = pkgs.lib.mkLibraryPath [
    pkgs.glibc
  ];
in
pkgs.mkShell {
  shellHook = ''
    export LD_LIBRARY_PATH=${libpath}
  '';
  nativeBuildInputs = with buildPackages; [
    pkgs.glibc
  ];
}
