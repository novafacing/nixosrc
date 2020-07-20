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
        rev = "2da7b962eb4027e603ed30882c29013b896f3ddb";
        sha256 = "14gc2ilv0vp9n57fizr5i9a8cq9grhxd6m1frb8lij9skczhdirr";
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
    lightline-gitdiff = pkgs.vimUtils.buildVimPlugin {
      name = "lightline-gitdiff";
      src = pkgs.fetchFromGitHub {
        owner = "novafacing";
        repo = "lightline-gitdiff";
        rev = "06792315b9bf529d5777d8dd7e3798603649fe5e";
        sha256 = "04iw544axzpgmpn23xmlr1z34zrks905nbk5m1pn82b2xzg2l3gs";
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
        "lightline-gitdiff"
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