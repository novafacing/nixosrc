{config, pkgs, lib, ... }:
let
  customPlugins = {
    lightline-vim = pkgs.vimUtils.buildVimPlugin {
      name = "lightline-vim";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
        repo = "lightline.vim";
        rev = "865c5c3b3065d281ad4325107e522209962a238c";
        sha256 = "1s16wa38rj2zbmvakkwpb1q6f4f7xlg2h389vhi25vbrbsd9ixws";
      };
    };
    gruvbox-material = pkgs.vimUtils.buildVimPlugin {
      name = "gruvbox-material";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
        repo = "gruvbox-material";
        rev = "5444d67258eb4d1aa4c71ccdebc907b176fc2f76";
        sha256 = "0rmns1w5krmpf24kaj8rvrad1r8iqi8i6nvgr61dgqc7xbdk7i3w";
      };
    };
    artify = pkgs.vimUtils.buildVimPlugin {
      name = "artify";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
	repo = "artify.vim";
	rev = "57b0999f141cd6e57b57a0b22ab44d9affb298ba";
	sha256 = "0pcynjh8s288fmdfhn8i2afkfs4gjdrvfgi95l2sxia85hqqbm1i";
      };
    };
    lightline-asyncrun = pkgs.vimUtils.buildVimPlugin {
      name = "lightline-asyncrun";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
	repo = "lightline-asyncrun";
	rev = "08b3756bb5a31011a4a415c224db9acb2edb22db";
	sha256 = "1n07sf3flpspcbr15s3afwij745j6fdngbq0ani3d3vf7rl3g3h9";
      };
    };
    lightline-bufferline = pkgs.vimUtils.buildVimPlugin {
      name = "lightline-bufferline";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
	repo = "lightline-bufferline";
	rev = "17683bc5802de7f295f2583a15461e2bc662f98b";
	sha256 = "1rlamxwk2gm9pyxl9vym9w6rhgimzqa2hjghy3qdqwvif6w8ir6l";
      };
    };
    vim-pomodoro = pkgs.vimUtils.buildVimPlugin {
      name = "vim-pomodoro";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
	repo = "vim-pomodoro";
	rev = "c2b90dfa17fd92252b5776778cb785988ecd5883";
	sha256 = "10c6x0yjwn0fsbp9h5bd8i0wqgp450jgvq8h617v1wnb25l4fhk8";
      };
    };
  };
in
{
  nixpkgs.config.packageOverrides = pkgs: {
    neovim = pkgs.neovim.override {
      vimAlias = true;
      configure = {
        pathogen = {
	  knownPlugins = pkgs.vimPlugins // customPlugins;
          pluginNames = with pkgs.vimPlugins // customPlugins; [
	    "LanguageClient-neovim"
	    "nerdtree"
	    "vim-easymotion"
	    "supertab"
	    "indentLine"
	    "vim-easy-align"
	    "nerdcommenter"
	    "vim-surround"
	    "vim-repeat"
	    "UltiSnips"
	    "vim-snippets"
	    "tabular"
	    "vim-devicons"
	    "typescript-vim"
	    "vim-nix"
	    "vim-vue"
	    "undotree"
	    "vim-manpager"
	    "vCoolor-vim"
	    "vim-gitbranch"
	    "vim-fugitive"
	    "vim-rhubarb"
	    "vim-twig"
	    "vimagit"
	    "vim-mergetool"
	    "ale"
	    "vim-flake8"
            "gruvbox-material"
            "lightline-vim"
            "lightline-bufferline"
            "lightline-ale"
	    "lightline-asyncrun"
	    "vim-pomodoro"
	    "artify"
	  ];
        };
        customRC = (import ./vimrc.nix { inherit lib; }).customRC;
        packages.myPlugins = with pkgs.vimPlugins // customPlugins; {
          start = [
          ];
        };
      };
    };
  };
}
