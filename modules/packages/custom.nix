{ pkgs, ...}:
{
  imports = [
  ];
  nixpkgs.overlays = import ./custom ++ import ./obs-ndi;
  nixpkgs.config.allowUnfree = true;
}
