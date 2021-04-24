{ config, lib, pkgs, fetchurl, ... }:

{
  home.file.".gdbinit".text = ''
  set disassembly-flavor intel
  alias disas = disassemble
  '';
}
