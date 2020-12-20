{ config, pkgs, stdenv, fetchurl, fetchgit, ... }:
let
  myNodePackages = (pkgs.callPackage ./node {});
  luaPkgs = (pkgs.callPackage ./lua {});
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
      bc
      bitwarden
      blender
      cabal2nix
      chromium
      coq
      dfilemanager
      discord-canary
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
      libimobiledevice
      my.aseprite
      my.bumblebee-status
      my.jflap
      my.smartgit
      obs-studio
      obs-v4l2sink
      one_gadget
      qpaeq
      reaper
      rustc
      rustup
      signal-desktop
      skypeforlinux
      slack
      spotify
      steam
      thunderbird
      tikzit
      twmn
      unetbootin
      vlc
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
      nix-du
      nix-index
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
      universal-ctags
      unzip
      wget
      whois
      wine
      winetricks
      xclip
      xxd
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
      cabal-install
      ccls
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
      lldb_11
      manpages
      meson
      mgba
      my.autopatchelf
      my.buildShellShim
      ninja
      nodePackages.node2nix
      nodejs
      patchelf
      pkg-config
      postman
      rgbds
      sloccount
      valgrind

      # Lua
      luaWithPackages

      #Additional Lua Utilities
      love

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
    ];

  # Dev manpages
  documentation.dev.enable = true;
  programs.nm-applet.enable = true;
  programs.gnupg.agent.enable = true;
}

