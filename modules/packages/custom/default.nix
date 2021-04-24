[
  (self: super: with super; {
    my = {
      autopatchelf = (callPackage ./autopatchelf.nix {});
      aseprite = (callPackage ./aseprite.nix {});
      binaryninja = (callPackage ./binaryninja.nix {});
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
      bumblebee-status = (callPackage ./bumblebee-status {});
      cemu = (pkgs.qt5.callPackage ./cemu.nix {});
      fira-code-icursive = (callPackage ./fira-code-icursive.nix {});
      imhex = (callPackage ./imhex {});
      jflap = (callPackage ./jflap.nix {});
      nix-doc = (callPackage ./nix-doc.nix {});
      nix-npm-install = (callPackage ./nix-npm-install.nix {});
      ocra = (callPackage ./ocra.nix {});
      wally-cli = (callPackage ./wally-cli.nix {});
      ghidra = (callPackage ./ghidra.nix {});
    };
  })
]
