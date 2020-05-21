[
  (self: super: with super; {
    my = {
      fira-code-icursive = (callPackage ./fira-code-icursive.nix {});
      bumblebee-status = (callPackage ./bumblebee-status {});
      nix-npm-install = (callPackage ./nix-npm-install.nix {});
      wally-cli = (callPackage ./wally-cli.nix {});
      binaryninja = (callPackage ./binaryninja.nix {});
      autopatchelf = (callPackage ./autopatchelf.nix {});
    };
  })
]
