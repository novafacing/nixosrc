call plug#begin('~/.config/nvim/bundle')
" Theme
Plug 'sainnhe/gruvbox-material'

" UI
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'scrooloose/nerdtree'
Plug 'rmolin88/pomodoro.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'liuchengxu/vim-which-key', { 'on': [ 'WhichKey', 'WhichKey!' ] }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight!!' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'roman/golden-ratio'
Plug 'sainnhe/artify.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'yuttie/comfortable-motion.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Text Manipulation
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeats'
Plug 'SirVer/UltiSnips'
Plug 'novafacing/vim-snippets'
Plug 'godlygeek/tabular'

" Syntax + Highlighters
Plug 'tjdevries/coc-zsh'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'LnL7/vim-nix'
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'posva/vim-vue'
Plug 'bfrg/vim-cpp-modern', { 'as': 'vim-syntax-c-cpp', 'for': [ 'c', 'cpp' ] }
Plug 'wizicer/vim-jison'

" Extensions
Plug 'mbbill/undotree'
Plug 'lambdalisue/vim-manpager'
Plug 'KabbAmine/vCoolor.vim'


" Git
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sodapopcan/vim-twiggy'
Plug 'cohama/agit.vim'
Plug 'samoshkin/vim-mergetool'

" Linters and Fixers
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'
Plug 'psf/black'

call plug#end()
