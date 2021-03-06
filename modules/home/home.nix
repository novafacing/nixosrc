{ config, pkgs, ... }:

# This function is called in the home-manager context, so we can use home-manager
# provided functions, which is quite nice.

let
  mod = "Mod1";
  settings = import ../../config/settings.nix;
in
with pkgs.lib; {
  # These define everything I use that is managed by 
  # home-manager. This choice is usually because home-manager has a better
  # configuration for it (so NOT neovim)
  imports = [
    ./i3.nix
    ./zsh.nix
    ./kitty.nix
    ./binaryninja.nix
    ./emacs.nix
    # ./gdb.nix
  ];

  # Make sure we obey the nixpkgs free/nonfree rules
  nixpkgs.config = {
    allowUnfree = settings.allowUnfree;
  };

  /*
  nixpkgs.overlays = [
    (self: super: {
      xdg-utils = pkgs.xdg_utils;
    })
  ];
  */

  # TODO: Pass settings.username and settings.email as args to a git.nix file
  # Configure git with aliases and such
  programs.git = {
    enable = true;
    # Identity
    userName = settings.username; 
    userEmail = settings.email; 
    signing = {
      signByDefault = true;
      key = "2166 6411 6223 98E4 D604  1C4A C7DA B792 C0E0 80F4";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    # Global git aliases
    aliases = {
      co = "checkout";
      status = "status --sort --branch";
      # Tack newly staged files to the last commit
      commend = "commit --amend --no-edit";
      it = "!git init && git commit -m “root” --allow-empty";
      # Graphical log
      grog = ''log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'';
      undo = "reset --soft HEAD^";
      staash = "stash save --include-untraced";
    };
    # Global gitignores
    ignores = [
      "*.o"
      "*.so"
      "*.a"
    ];
  };
  programs.go.enable = true;
}

