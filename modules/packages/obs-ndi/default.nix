[
  (self: super: with super; {
    obsndi = (callPackage ./obs-ndi.nix { myndi = my.ndi; });
  })
]
