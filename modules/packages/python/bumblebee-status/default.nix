{ pkgs, ...}:
let
  python = import ./requirements.nix { inherit pkgs; };
in python.mkDerivation {
  name = "bumblebee-status";
  src = ./.;
  buildInputs = with pkgs; [
    libgit2
    libffi
  ];
  propagatedBuildInputs = builtins.attrValues python.packages;
}
