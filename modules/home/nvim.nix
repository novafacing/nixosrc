{ lib, config, pkgs, nixpkgs ? import <nixpkgs> {}, ... }:
let 
  conf = {
    vam.knownPlugins = pkgs.vimPlugins;
    pluginDictionaries = nixpkgs.neovim.extraPluginDictionaries ++ [
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
          "lightline-gitdiff"
          "lightline-bufferline"
          "lightline-ale"
          "lightline-asyncrun"
          "nerdtree"
          "pomodoro.vim"
          "golden-ratio"
          "artify.vim"
          "comfortable-motion.vim"
          "vim-easymotion"
          "supertab"
          "indentLine"
          "vim-easy-align"
          "nerdcommenter"
          "vim-matchup"
          "vim-surround"
          "vim-repeats"
          "UltiSnips"
          "vim-snippets"
          "tabular"
          "coc-zsh"
          "inline_edit.vim"
          "vim-devicons"
          "typescript-vim"
          "vim-jsx-typescript"
          "vim-nix"
          "vim-vue"
          "vim-jison"
          "undotree"
          "vim-manpager"
          "vCoolor.vim"
          "vim-gitbranch"
          "vim-fugitive"
          "vim-rhubarb"
          "vim-twiggy"
          "agit.vim"
          "vim-mergetool"
          "ale"
          "vim-flake8"
          "black"
	];
      }
    ];
    customRC = (import ./vimrc.nix { inherit lib; }).customRc;
  };
in 
with pkgs.lib; {
  neovim.customize {
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = conf.pluginDictionaries;
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython = true;
    withPython3 = true;
    # configure = config;
  };
}
