{ config, pkgs, lib, ... }:

with lib; {
  options = {
    settings = {
      name = mkOption {
        default = "Rowan Hart";
	type = with types; uniq str;
      };
      username = mkOption {
        default = "novafacing";
	type = with types; uniq str;
      };
      email = mkOption {
        default = "rowanbhart@gmail.com";
	type = with types; uniq str;
      };
      vm = mkOption {
	default = false;
        type = types.bool;
      };
      terminal = mkOption {
        default = "kitty";
	type = with types; uniq str;
      };
      fontName = mkOption {
        default = "Fira Code";
	type = with types; uniq str;
      };
      fontSize = mkOption {
        default = 10;
	type = types.int;
      };
    };
  };
}
