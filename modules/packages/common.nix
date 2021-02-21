{ config, pkgs, stdenv, fetchurl, fetchgit, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
  luaPkgs = (pkgs.callPackage ./lua {});
  extensions = (with pkgs.vscode-extensions; [
    formulahendry.auto-rename-tag
    ms-vscode.cpptools
    ms-azuretools.vscode-docker
    dbaeumer.vscode-eslint
    ms-python.python
    ms-vscode-remote.remote-ssh
    vscodevim.vim
  ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
    name = "bracket-pair-colorizer";
    publisher = "coenraads";
    version = "1.0.61";
    sha256 = "0r3bfp8kvhf9zpbiil7acx7zain26grk133f0r0syxqgml12i652";
  }
  {
    name = "cmake";
    publisher = "twxs";
    version = "0.0.17";
    sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
  }
  {
    name = "cmake-tools";
    publisher = "ms-vscode";
    version = "1.6.0";
    sha256 = "1j3b6wzlb5r9q2v023qq965y0avz6dphcn0f5vwm9ns9ilcgm3dw";
  }
  {
    name = "vscode-colorize";
    publisher = "kamikillerto";
    version = "0.10.0";
    sha256 = "1ka1a50cyynrva482i2ci7dljzzvvf992ac9yybdx47br655zy2h";
  }
  {
    name = "vscode-css-peek";
    publisher = "pranaygp";
    version = "4.1.0";
    sha256 = "0q7500nyip3ijbpkj0p0963cmnswz7cv4hrdx4lvyjjnhqp714m8";
  }
  {
    name = "go";
    publisher = "golang";
    version = "0.22.1";
    sha256 = "1gbb13gmif2zzia49153czk3ib6lgwg37gx8gzs4773m9x5hmb2l";
  }
  {
    name = "gruvbox-material";
    publisher = "sainnhe";
    version = "6.3.6";
    sha256 = "02h3c6knh52jhl62bdwpbsn7nfb6ybbbzn7hx3kmdayhd0qf6rp6";
  }
  {
    name = "vscode-html-css";
    publisher = "ecmel";
    version = "1.10.2";
    sha256 = "0qzh7fwgadcahxx8hz1sbfz9lzi81iv4xiidvfm3sahyl9s6pyg1";
  }
  {
    name = "jupyter";
    publisher = "ms-toolsai";
    version = "2021.2.576440691";
    sha256 = "0dia2qbvmfc1ijswng39ni3imqssib2bnclwk3lr8bmkl31xg5sh";
  }
  {
    name = "liveserver";
    publisher = "ritwickdey";
    version = "5.6.1";
    sha256 = "077arf3hsn1yb8xdhlrax5gf93ljww78irv4gm8ffmsqvcr1kws0";
  }
  {
    name = "markdown-all-in-one";
    publisher = "yzhang";
    version = "3.4.0";
    sha256 = "0ihfrsg2sc8d441a2lkc453zbw1jcpadmmkbkaf42x9b9cipd5qb";
  }
  {
    name = "nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  }
  {
    name = "path-intellisense";
    publisher = "christian-kohler";
    version = "2.3.0";
    sha256 = "1wyp3k4gci1i64nrry12il6yflhki18gq2498z3nlsx4yi36jb3l";
  }
  {
    name = "project-manager";
    publisher = "alefragnani";
    version = "12.0.1";
    sha256 = "1bckjq1dw2mwr1zxx3dxs4b2arvnxcr32af2gxlkh4s26hvp9n1v";
  }
  {
    name = "remote-containers";
    publisher = "ms-vscode-remote";
    version = "0.161.0";
    sha256 = "0sdgl6q46xxkx2caz1vdq6m0n9d5vm2qqc70rgwh4nm4s8s8an8s";
  }
  {
    name = "remote-ssh-edit";
    publisher = "ms-vscode-remote";
    version = "0.64.0";
    sha256 = "1n35m928vfr7xhn7kc8hp8q302nnbvkpfb0jpi0di05k8c4vb033";
  }
  {
    name = "vscodeintellicode";
    publisher = "visualstudioexptteam";
    version = "1.2.11";
    sha256 = "057szin28d4sz18b1232xjhf5jjnw2574q34vs3npblhc1jb5y3p";
  }
  {
    name = "vscode-icons";
    publisher = "vscode-icons-team";
    version = "11.1.0";
    sha256 = "1xrz9f0nckx29wxpmlj1dqqiaal3002xwgzz5p9iss119sxgpwrx";

  }
  ];
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = extensions;
  };
in
  let
    luaWithPackages = (pkgs.lua5_2_compat.withPackages(ps: with ps // luaPkgs; [

    # Builtin Lua Packages
    luasocket
    luafilesystem
    moonscript
    lpeg
  ])).override(args: { 
    ignoreCollisions = true; 
  });
  in
  with (import <nixpkgs> {}); {
    imports = [
      ./neovim
      ./fonts.nix
      ./python
    ];

    environment.systemPackages = with pkgs // myNodePackages; [
      # GUI Apps

      arandr
      audacity
      bashSnippets
      bc
      bitwarden
      blender
      cabal2nix
      calibre
      # cemu
      chromium
      chuck
      coq
      dfilemanager
      # discord-canary
      discord
      dot2tex
      etcher
      firefox
      fsuae
      gcolor2
      gcolor3
      ghc
      gimp
      gnome3.zenity
      google-drive-ocamlfuse
      googleearth
      gparted
      hexchat
      ifuse
      inkscape
      inkscape
      keybase
      keybase-gui
      libimobiledevice
      libreoffice
      my.aseprite
      my.bumblebee-status
      # my.imhex
      my.jflap
      mullvad-vpn
      obs-studio
      obs-v4l2sink
      one_gadget
      openssl
      poppler_utils
      qbittorrent
      qpaeq
      rawtherapee
      reaper
      rustc
      rustup
      signal-desktop
      skypeforlinux
      slack
      spotify
      steam
      testdisk
      thunderbird
      tikzit
      twmn
      unetbootin
      vlc
      vscode-with-extensions
      wakelan
      woeusb
      zathura
      zoom-us

      # Reversing tools
      afl
      appimagekit
      exiftool
      gdb
      ghidra-bin
      gradle
      my.binaryninja
      pypy3
      radare2
      squashfsTools
      wireshark


      # Console Utilities
      appimage-run
      bat
      bind
      coreutils
      curl
      exa
      feh
      ffmpeg
      font-awesome
      file
      fzf
      gnupg
      gotop
      graphviz
      htop
      jdk11
      llvm
      ltrace
      lz4
      my.nix-doc
      my.ocra
      my.wally-cli
      nasm
      ncdu
      ncspot
      nerdfonts
      nix-du
      nix-index
      nix-prefetch-git
      nmap
      nmap_graphical
      nox
      openjdk
      openvpn
      parted
      pdfgrep
      pinentry-curses
      pypi2nix
      silver-searcher
      sqlite
      sshfs
      sshuttle
      texlive.combined.scheme-full
      tmux
      universal-ctags
      unzip
      wget
      whois
      wineWowPackages.stable
      winetricks
      xclip
      xxd
      z3 # includes python bindings
      zip

      # i3 Hotkey Commands
      brightnessctl
      clipmenu
      maim
      noisetorch
      pavucontrol

      # Development
      arduino
      ascii
      avrdude
      binutils
      bison
      bundix
      bundler
      cabal-install
      ccls
      cdrtools
      clangMultiStdenv
      clang_11
      cmake
      colordiff
      docker-compose
      doxygen
      flex
      gcc10
      gcc_multi
      gnumake
      gnupg
      godot
      grub2
      libnotify
      lldb_11
      manpages
      meson
      mgba
      mono
      musl
      my.autopatchelf
      my.buildShellShim
      ninja
      nodePackages.node2nix
      nodejs
      patchelf
      pkg-config
      postman
      qemu
      rgbds
      ruby
      sloccount
      valgrind
      vimpager
      w3m
      xorriso

      # Lua
      luaWithPackages

      #Additional Lua Utilities
      love_11

      # Node packages (see readme!)
      eslint
      jsonlint

      # Packages with configuration
      kitty
      neovim
      rofi
      rofi-emoji

      # Libraries
      llvmPackages.libclang
      llvmPackages.libclang.lib

      # PHP
      php74
      php74Packages.composer2
    ];

  # Dev manpages
  documentation.dev.enable = true;
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

