{ config, pkgs, ... }:

# This function is called in the home-manager context, so we can use home-manager
# provided functions, which is quite nice.

let
  mod = "Mod1";
  settings = import ../../config/settings.nix;
in
with pkgs.lib; {
  imports = [
    ./i3.nix
    ./zsh.nix
    #./nvim.nix
    ./kitty.nix
  ];

  # Make sure we obey the nixpkgs free/nonfree rules
  nixpkgs.config = {
    allowUnfree = settings.allowUnfree;
  };

  # TODO: Pass settings.username and settings.email as args to a git.nix file
  # Configure git with aliases and such
  programs.git = {
    enable = true;
    # Identity
    userName = settings.username; 
    userEmail = settings.email; 
    # Global git aliases
    aliases = {
      co = "checkout";
      s = "status --sort --branch";
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
    ];
  };
}

