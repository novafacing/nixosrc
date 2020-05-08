{ lib, config, pkgs, nixpkgs ? import <nixpkgs> {}, ... }:
let 
    extraVamDictionaries = [
      /*
      {
        name = "vim-hexokinase"; 
	"do" = "make hexokinase";
      }
      {
        name = "vim-which-key"; 
	"on"= [ 
	  "WhichKey" 
	  "WhichKey!" 
	];
      }
      {
        name = "limelight.vim"; 
	"on" = "Limelight!!";
      }
      {
        name = "markdown-preview.nvim";
	"do" = "cd app & yarn install";

      }
      {
        name = "goyo.vim"; 
        "on" = "Goyo";
      }
      {
        name = "LeaderF";
	"do" =  "./install.sh";
      }
      {
        name = "vim-json";
	"for" = "json";
      }
      {
        name = "vimtex";
	"for" = "latex";
      }
      {
        name = "vim-cpp-modern";
	"as" = "vim-syntax-c-cpp"; 
	"for" = [ "c" "cpp" ];
      }
      {
          name = "deoplete.nvim";
	  "do" = ":UpdateRemotePlugins";
      }
      {
        names = [
	  "LanguageClient-neovim"
	  "lightline.vim"
          # "lightline-gitdiff"
          "lightline-bufferline"
          "lightline-ale"
          # "lightline-asyncrun"
          "nerdtree"
          # "pomodoro.vim"
          # "golden-ratio"
          # "artify.vim"
          # "comfortable-motion.vim"
          "vim-easymotion"
          "supertab"
          "indentLine"
          "vim-easy-align"
          "nerdcommenter"
          # "vim-matchup"
          "vim-surround"
          "vim-repeat"
          "UltiSnips"
          "vim-snippets"
          "tabular"
          "coc-zsh"
          # "inline_edit.vim"
          "vim-devicons"
          "typescript-vim"
          # "vim-jsx-typescript"
          "vim-nix"
          "vim-vue"
          # "vim-jison"
          "undotree"
          "vim-manpager"
          "vCoolor.vim"
          "vim-gitbranch"
          "vim-fugitive"
          "vim-rhubarb"
          "vim-twig"
          "vimagit"
          "vim-mergetool"
          "ale"
          "vim-flake8"
          # "black"
	];
      }
      {
        name = "matchmaker";
      }
      */
    ];
in 
{
  nixpkgs.config.packageOverrides = old: {
    old.neovim.override {
      vimAlias = true;
      configure = {
        pathogen = {
          pluginNames = with pkgs.vimPlugins; [
	    deoplete-nvim
	  ];
        };
      };
    };
  };
}
}
