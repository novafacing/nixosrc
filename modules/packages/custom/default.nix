[
  (self: super: with super; {
    my = {
      fira-code-icursive = (callPackage ./fira-code-icursive.nix {});
      bumblebee-status = (callPackage ./bumblebee-status {});
    };
  })
]
