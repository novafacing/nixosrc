{ config, pkgs, lib, ... }:
let
 cfg  config.neovim;
in
with lib; {
  options.neovim = {
    python3 = mkOption {
      type = types.package;
      default = pkgs.python3;
    };
  };
  config =
let
  mynvim = (pkgs.neovim.override {
    configure = {
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
	  gruvbox
	] ++ map (pluginRule: pluginRule.p) (pkgs.lib.filter (pluginRule: pluginRule.startup or false) pluginRules);
      
