{ pkgs ? import <nixpkgs> {} }:
let
  libpath = pkgs.lib.makeLibraryPath [
    pkgs.glibc
  ];
in
pkgs.mkShell {
  shellHook = ''
    export LD_LIBRARY_PATH=${libpath}
  '';
  nativeBuildInputs = with pkgs.buildPackages; [
    pkgs.glibc
  ];
}
