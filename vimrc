" Pre-defined globals
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'
let g:loaded_python_provider = 0
let g:which_key_map = {}
let g:lightline = {}
let g:lightlineArtify = 1
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"KEY MAPPINGS"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip whitespace
nnoremap <Leader>sw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
let g:which_key_map.s = {'name': 'Sed/Format Utilities'}
let g:which_key_map.s.w = 'Strip Whitespace'
" set leader
let mapleader = ","
let maplocalleader = ","
" Map buffer movement for nerdtree
nnoremap <C-.> :bn<CR>
nnoremap <C-,> :bp<CR>
cmap Q q
cmap W w
" up visual line instead of line, capitals do regular lines
nnoremap J j
nnoremap j gj
nnoremap k gk
" easymotion w instead of normal w
nmap w <Plug>(easymotion-bd-w)
" Navigate buffers without W (uses C-j...)
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>bh :bp
nnoremap <leader>bl :bn
nnoremap <leader>bs :buffers
let g:which_key_map.b = {'name' : 'Buffers'}
let g:which_key_map.b.h = 'Navigate buffer backward'
let g:which_key_map.b.l = 'Navigate buffer forward'
let g:which_key_map.b.s = 'Display buffers'
" Tab navigation
" center screen on currline
nmap <Leader><Space> zz
" Next ALE error
nnoremap <leader>n :ALENext<CR>
"n / N center search result
nmap n nzz
nmap N Nzz
" Yank to end of line
map Y y$
" Per-Plugin mappings are grouped with those plugins
" Do not highlight search terms
set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"MISCELLANEOUS"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"PLUGIN CONFIG"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Vundle
filetype off
if has('nvim')
    set rtp+=~/.config/nvim/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
" Overall primary plugin
Plugin 'VundleVim/Vundle.vim'
" Themes & Appearance
" Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
    set termguicolors
    set background=dark
    let g:gruvbox_material_background = 'soft'
    let g:lightline.colorscheme = 'gruvbox_material'
    let g:gruvbox_material_enable_italic = 1
Plugin 'itchyny/lightline.vim'
    let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
    let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
    let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
    let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
    let g:lightline#ale#indicator_checking = "\uf110"
    let g:lightline#ale#indicator_warnings = "\uf529"
    let g:lightline#ale#indicator_errors = "\uf00d"
    let g:lightline#ale#indicator_ok = "\uf00c"
    let g:lightline_gitdiff#indicator_added = '+'
    let g:lightline_gitdiff#indicator_deleted = '-'
    let g:lightline_gitdiff#indicator_modified = '*'
    let g:lightline_gitdiff#min_winwidth = '70'
    let g:lightline#asyncrun#indicator_none = ''
    let g:lightline#asyncrun#indicator_run = 'Running...'
    if g:lightlineArtify == 1
      let g:lightline.active = {
            \ 'left': [ [ 'artify_mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
            \ 'right': [ [ 'artify_lineinfo' ],
            \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
            \           [ 'asyncrun_status', 'coc_status' ] ]
            \ }
      let g:lightline.inactive = {
            \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [ [ 'artify_lineinfo' ] ]
            \ }
      let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs', 'buffers'] ],
            \ 'right': [ [ 'artify_gitbranch', 'close'],
            \ [ 'gitstatus' ] ]
            \ }
      let g:lightline.tab = {
            \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
            \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
    else
      let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'pomodoro' ],
            \           [ 'asyncrun_status', 'coc_status' ] ]
            \ }
      let g:lightline.inactive = {
            \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
            \ 'right': [ [ 'lineinfo' ] ]
            \ }
      let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ [ 'gitbranch' ],
            \ [ 'gitstatus' ] ]
            \ }
      let g:lightline.tab = {
            \ 'active': [ 'tabnum', 'filename', 'modified' ],
            \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
    endif
    let g:lightline.tab_component = {
          \ }
    let g:lightline.tab_component_function = {
          \ 'artify_activetabnum': 'Artify_active_tab_num',
          \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
          \ 'artify_filename': 'Artify_lightline_tab_filename',
          \ 'filename': 'lightline#tab#filename',
          \ 'modified': 'lightline#tab#modified',
          \ 'readonly': 'lightline#tab#readonly',
          \ 'tabnum': 'Tab_num'
          \ }
    let g:lightline.component = {
          \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
          \ 'artify_mode': '%{Artify_lightline_mode()}',
          \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
          \ 'gitstatus' : '%{lightline_gitdiff#get_status()}',
          \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
          \ 'vim_logo': "\ue7c5",
          \ 'pomodoro': '%{PomodoroStatus()}',
          \ 'mode': '%{lightline#mode()}',
          \ 'absolutepath': '%F',
          \ 'relativepath': '%f',
          \ 'filename': '%t',
          \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
          \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
          \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
          \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
          \ 'modified': '%M',
          \ 'bufnum': '%n',
          \ 'paste': '%{&paste?"PASTE":""}',
          \ 'readonly': '%R',
          \ 'charvalue': '%b',
          \ 'charvaluehex': '%B',
          \ 'percent': '%2p%%',
          \ 'percentwin': '%P',
          \ 'spell': '%{&spell?&spelllang:""}',
          \ 'lineinfo': '%2p%% %3l:%-2v',
          \ 'line': '%l',
          \ 'column': '%c',
          \ 'close': '%999X X ',
          \ 'winnr': '%{winnr()}'
          \ }
    let g:lightline.component_function = {
          \ 'gitbranch': 'Gitbranch',
          \ 'devicons_filetype': 'Devicons_Filetype',
          \ 'devicons_fileformat': 'Devicons_Fileformat',
          \ 'coc_status': 'coc#status',
          \ 'coc_currentfunction': 'CocCurrentFunction'
          \ }
    let g:lightline.component_expand = {
          \ 'linter_checking': 'lightline#ale#checking',
          \ 'linter_warnings': 'lightline#ale#warnings',
          \ 'linter_errors': 'lightline#ale#errors',
          \ 'linter_ok': 'lightline#ale#ok',
          \ 'asyncrun_status': 'lightline#asyncrun#status',
          \ 'buffers': 'lightline#bufferline#buffers'
          \ }
    let g:lightline.component_type = {
          \ 'linter_warnings': 'warning',
          \ 'linter_errors': 'error',
          \ 'buffers': 'tabsel'
          \ }
    let g:lightline.component_visible_condition = {
          \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
          \ }
Plugin 'itchyny/vim-gitbranch'
Plugin 'macthecadillac/lightline-gitdiff'
Plugin 'maximbaz/lightline-ale'
Plugin 'albertomontesg/lightline-asyncrun'
Plugin 'rmolin88/pomodoro.vim'
" Productivity & Enhancement
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
Plugin 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0 " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
Plugin 'scrooloose/nerdtree'
    " Close window if only a nerdtree is left
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    map <Leader>t :NERDTreeToggle<CR>
    Plugin 'tjdevries/coc-zsh'
    Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    nnoremap <Leader>he :HexokinaseToggle
    let g:Hexokinase_highlighters = ['virtual']
    let g:Hexokinase_ftEnabled = ['css', 'html']
    let g:Hexokinase_optInPatterns = [
                \     'full_hex',
                \     'triple_hex',
                \     'rgb',
                \     'rgba',
                \     'hsl',
                \     'hsla'
                \ ]
    let g:Hexokinase_ftAutoload = ['html', 'css']
    let g:Hexokinase_refreshEvents = ['BufWritePost']
    let g:which_key_map.he = 'Toggle Hexokinase Coloring'
" Guide for leader press so you don't have to remember what's what
Plugin 'liuchengxu/vim-which-key', { 'on': [ 'WhichKey', 'WhichKey!' ] }
    nnoremap <silent> <leader> :WhichKey ','<CR>
" Lines and etc for indentation
Plugin 'Yggdroot/indentLine'
    let g:indentLine_enabled = 1
    let g:indentLine_leadingSpaceEnabled = 0
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_setColors = 0
    let indentLine_color_term = 'lightgrey'
    let indentLine_char = '|'
Plugin 'junegunn/vim-easy-align'
" Focused writing (GUI off)
Plugin 'junegunn/limelight.vim', { 'on': 'Limelight!!' }
    let g:limelight_default_coefficient = 0.7
    nnoremap <silent> <leader><space>f :<C-u>Limelight!!<CR>
Plugin 'junegunn/goyo.vim', { 'on': 'Goyo' }
    let g:goyo_width = 95
    let g:goyo_height = 85
    let g:goyo_linenr = 0
    augroup goyoCustom
        autocmd! User GoyoEnter Limelight
        autocmd! User GoyoLeave Limelight!
    augroup END
    nnoremap <silent> <leader><space>r :<C-u>Goyo<CR>
" Resize windows to be a nice size
Plugin 'roman/golden-ratio'
" Enable font switching per-token
Plugin 'sainnhe/artify.vim'
" Configs for this are mostly in the functions section 
" Fuzzy search files, buffers, etc
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
    let g:Lf_ShowDevIcons = 1
    let g:Lf_PreviewInPopup = 1
    let g:Lf_ShortcutF = "<leader>ff"
    noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
    let g:which_key_map.f = {'name': 'Leader F Search Functions'}
    let g:which_key_map.f.b = 'Buffer search'
    let g:which_key_map.f.l = 'Line search'
" Visualize Undos
Plugin 'mbbill/undotree'
" Git plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'cohama/agit.vim'
Plugin 'samoshkin/vim-mergetool'
    let g:mergetool_layout = 'mr'
    let g:mergetool_prefer_revision = 'local'
" Fast n pretty comments
Plugin 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' },'python': { 'left': "'''",'right': "'''" } }
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
    let g:NERDToggleCheckAllLines = 1
" Inline editing: js within vue, etc
Plugin 'AndrewRadev/inline_edit.vim'
" Physics-based inertial scrolling
Plugin 'yuttie/comfortable-motion.vim'
    let g:comfortable_motion_scroll_down_key = "J"
    let g:comfortable_motion_scroll_up_key = "K"
" Analyze slow plugins, etc
Plugin 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
" Match parens, hotwords, etc
Plugin 'andymass/vim-matchup'
    let g:loaded_matchit = 1
" Use vim for manpages
" Note you must also `export MANPAGER="vim -c MANPAGER -"`
Plugin 'lambdalisue/vim-manpager'
" Insert closing symbols automatically
" Color json files better
Plugin 'elzr/vim-json', { 'for': 'json' }
    au BufNewFile,BufRead *.json call VimJsonFormat()
" Color picker for inserting rgb colors
Plugin 'KabbAmine/vCoolor.vim'
    let g:vcoolor_lowercase = 1
    let g:vcoolor_map = '<Leader>vcm'
    let g:vcool_ins_rgb_map = '<Leader>rgb'
    let g:vcool_ins_rgba_map = '<Leader>rgba'
    let g:vcoolor_custom_picker = 'zenity --title "Picker" --color-selection'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mengelbrecht/lightline-bufferline'
    autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
    autocmd BufNewFile,BufRead *.tsx,*.jsx filetype=typescript.tsx
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeats'
Plugin 'LnL7/vim-nix'

" Linters & Checkers
Plugin 'dense-analysis/ale'
    let g:ale_completion_enabled = 0
    let g:ale_linters = {'cpp': ['clang', 'gcc', 'cpplint'], 'python': ['black', 'flake8', 'pylint', 'mypy'], 'json': ['jsonlint', 'fixjson']}
    let g:ale_fixers = {'python': ['black'], 'json': ['fixjson'], 'javascript': ['eslint --fix']}
    let g:ale_fixers.javascript = ['eslint']
    let g:ale_fix_on_save = 1
    let g:ale_cpp_cplint_options='--headers=hpp'
    let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'
    let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra'
    let g:ale_sign_error = '|>'
    let g:ale_sign_warning = '!'
    highlight ALEErrorSign ctermbg=NONE ctermfg=red
    highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
Plugin 'nvie/vim-flake8'
    let python_highlight_all=1
Plugin 'SirVer/UltiSnips'
    nmap <Leader>ue :UltiSnipsEdit<cr>
    set runtimepath+=~/.vim/bundle/UltiSnips/UltiSnips/
    let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips/UltiSnips/', 'UltiSnips']
    let g:UltiSnipsExpandTrigger="<s-tab>"
    let g:UltiSnipsJumpForwardTrigger="<s-tab>"
    let g:UltiSnipsJumpBackwardTrigger="<C-s-tab>"
    let g:UltiSnipsEditSplit="vertical"
Plugin 'novafacing/vim-snippets'
Plugin 'godlygeek/tabular'
" Previewers
Plugin 'lervag/vimtex'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    let g:mkdp_browser="chromium-browser"
    let g:mkdp_auto_start=1
    let g:mkdp_auto_close=1
    set updatetime=100
Plugin 'tjvr/vim-nearley'
" To install black:
" apt install python3-venv
" pip3 install black
" python -m venv ~/.vim/black
" source ~/.vim/black/bin/activate
Plugin 'psf/black'
    let g:black_virtualenv="~/.vim/black"
Plugin 'posva/vim-vue'
Plugin 'bfrg/vim-cpp-modern', { 'as': 'vim-syntax-c-cpp', 'for': [ 'c', 'cpp' ] }
Plugin 'wizicer/vim-jison'
call vundle#end()
filetype plugin indent on
" End Vundle

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"SETTINGS"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox-material
syntax on
set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase                                                                  
set backspace=indent,eol,start                                                 
set autoindent                                                                 
set nostartofline                                                              
set ruler                                                                      
set laststatus=2                                                               
set confirm
set cmdheight=2
set number relativenumber
set smartcase
set cursorline
set incsearch
set wildmenu
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nofoldenable
set noerrorbells
set noswapfile
set completeopt-=preview
set encoding=utf-8
" External vimrc Commands
try
    set runtimepath^=~/.vim/bundle/matchparen++.vim
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry
"w! sudo save
command Sw w !sudo tee % > /dev/null
set lazyredraw
set backup
set nofixendofline
" set noeol
set termguicolors
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""
"EXTENDED FUNCTIONALITY"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent Undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
" configure vim backups
function! BackupDir()
    if has('win32') || has('win64')
        let l:backupdir=$VIM.'/backup/'.
                    \substitute(expand('%:p:h'), '\:', '~', '')
    else
        let l:backupdir=$HOME.'/.vim/backup/'.
                    \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
    endif
    if !isdirectory(l:backupdir)
        call mkdir(l:backupdir, 'p', 0700)
    endif
    let &backupdir=l:backupdir
    let &backupext=strftime('~%Y-%m-%d_%H-%M-%S~')
endfunction
" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction
" Json formatter: called on entering a json file
function! VimJsonFormat()
    let g:vim_json_syntax_conceal = 0
    set foldmethod=syntax
endfunction
function! PomodoroStatus() abort
    if pomo#remaining_time() ==# '0'
        return "\ue001"
    else
        return "\ue003 ".pomo#remaining_time()
    endif
endfunction
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
function! Devicons_Filetype()
    " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! Devicons_Fileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Artify_active_tab_num(n) abort
    return Artify(a:n, 'bold')." \ue0bb"
endfunction
function! Tab_num(n) abort
    return a:n." \ue0bb"
endfunction
function! Gitbranch() abort
    if gitbranch#name() !=# ''
        return gitbranch#name()." \ue725"
    else
        return "\ue61b"
    endif
endfunction
function! Artify_inactive_tab_num(n) abort
    return Artify(a:n, 'double_struck')." \ue0bb"
endfunction
function! Artify_lightline_tab_filename(s) abort
    return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction
function! Artify_lightline_mode() abort
    return Artify(lightline#mode(), 'monospace')
endfunction
function! Artify_line_percent() abort
    return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction
function! Artify_line_num() abort
    return Artify(string(line('.')), 'bold')
endfunction
function! Artify_col_num() abort
    return Artify(string(getcurpos()[2]), 'bold')
endfunction
function! Artify_gitbranch() abort
    if gitbranch#name() !=# ''
        return Artify(gitbranch#name(), 'monospace')." \ue725"
    else
        return "\ue61b"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"AUTO COMMANDS"
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"Set highlight after 80 for C/C++ & 120 for python
autocmd BufRead,BufNewFile *.c,*.h set colorcolumn=80
autocmd BufRead,BufNewFile *.py set colorcolumn=120
autocmd BufRead,BufNewFile *.c,*.h,*.py highlight ColorColumn ctermbg=lightgrey
" vim hex editing any file with .bin extension
" vim -b: edit binary using xxd-format!
augroup Binary
    au BufReadPre *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END
" Make backups of every file, every write, every time.
autocmd! bufwritepre * call BackupDir()
" 2-tab-sized spaces for cs240
autocmd BufNewFile,BufRead /home/novafacing/hub/cs/ta/*.c set expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.vue,*.js,*.tsx,*.jsx set expandtab tabstop=2 softtabstop=2 shiftwidth=2
" Parenthesis Matcher
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Another.... parenthesis matcher (?)
au BufEnter * : DoMatchParen
" Vim completions in vim. Go figure.
autocmd FileType vim let b:vcm_tab_complete = 'vim'
""Remove all trailing whitespace
"Lightline autos
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
