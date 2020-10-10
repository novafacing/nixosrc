[
  (self: super: with super; {
    my = {
      fira-code-icursive = (callPackage ./fira-code-icursive.nix {});
      bumblebee-status = (callPackage ./bumblebee-status {});
      nix-npm-install = (callPackage ./nix-npm-install.nix {});
      wally-cli = (callPackage ./wally-cli.nix {});
      binaryninja = (callPackage ./binaryninja.nix {});
      autopatchelf = (callPackage ./autopatchelf.nix {});
      buildShellShim = pkgs.writeScriptBin "buildShellShim.zsh" ''
        #! /usr/bin/env sh

        if [ "$1" = "--rcfile" ]; then
          # the rcfile flag indicates that the --command option was used.
          # This means the shell should stay open after executing. So we remove the last line which contains 'exit'
          shift
          tmp="$(cat $1)"
          echo ''${tmp%exit} > $1
          echo $NIX_EXECUTING_SHELL >> $1
          bash $1
        else
          bash "$@"
            fi
      '';
      aseprite = (callPackage ./aseprite.nix {});
      #ndi = (callPackage ./ndi.nix {});
      ocra = (callPackage ./ocra.nix {});
      nix-doc = (callPackage ./nix-doc.nix {});
      # myobs-ndi = (callPackage ./obs-ndi.nix {});
      smartgit = (callPackage ./smartgit.nix {});
      #sage = (callPackage ./sage/default.nix {});
      jflap = (callPackage ./jflap.nix {});
      #avrgcc-wrapper = pkgs.stdenv.mkDerivation rec {
      #  name = "avrgcc-wrapper-${version}";
      #  version = pkgs.stdenv.lib.strings.getVersion pkgs.avrgcc.name;
      #  nativeBuildInputs = [ pkgs.makeWrapper ];
      #  buildCommand = ''
      #    mkdir -p $out/bin
      #    for exe in gcc g++; do
      #      makeWrapper "${pkgs.avrgcc}/bin/avr-$exe" "$out/bin/avr-$exe" --add-flags "-B${pkgs.avrlibc}/avr/lib -isystem ${pkgs.avrlibc}/avr/include"
      #    done
      #    ln -s ${pkgs.avrgcc}/lib $out
      #  '';
      #};
    };
  })
]
