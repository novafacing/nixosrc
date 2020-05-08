[
  (self: super: with super; {
    my = {
      fira-code-icursive = (callPackage ./fira-code-icursive.nix {});
      neovim = (callPackage ./neovim.nix {});
    };
  })
]
