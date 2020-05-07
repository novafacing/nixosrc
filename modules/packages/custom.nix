{ pkgs, ...}:
{
  nixpkgs.overlays = import ./custom;
  nixpkgs.config.allowUnfree = true;
}
