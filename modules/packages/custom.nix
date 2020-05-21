{ pkgs, ...}:
{
  imports = [
  ];
  nixpkgs.overlays = import ./custom;
  nixpkgs.config.allowUnfree = true;
}
