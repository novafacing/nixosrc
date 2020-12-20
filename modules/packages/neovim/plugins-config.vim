" Themes & Appearance
set termguicolors
set background=dark
let g:gruvbox_material_background = 'soft'
let g:lightline.colorscheme = 'gruvbox_material'
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
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
                \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype', 'tagbar'] ],
                \ 'right': [ [ 'artify_lineinfo' ],
                \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
                \           [ 'asyncrun_status', 'coc_status' ] ]
                \ }
    let g:lightline.inactive = {
                \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
                \ 'right': [ [ 'artify_lineinfo', 'gitversion' ] ]
                \ }
    let g:lightline.tabline = {
                \ 'left': [ [ 'vim_logo', 'tabs', 'buffers'] ],
                \ 'right': [ [ 'artify_gitbranch', 'close'],
                \ [ 'gitdiff' ] ]
                \ }
    let g:lightline.tab = {
                \ 'active': [ 'artify_activetabnum', 'artify_filename', 'modified' ],
                \ 'inactive': [ 'artify_inactivetabnum', 'filename', 'modified' ] }
else
    let g:lightline.active = {
                \ 'left': [ [ 'mode', 'paste' ],
                \           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
                \ 'right': [ [ 'lineinfo' ],
                \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
                \           [ 'asyncrun_status', 'coc_status' ] ]
                \ }
    let g:lightline.inactive = {
                \ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
                \ 'right': [ [ 'lineinfo' ] ]
                \ }
    let g:lightline.tabline = {
                \ 'left': [ [ 'vim_logo', 'tabs' ] ],
                \ 'right': [ [ 'gitbranch' ],
                \ [ 'gitdiff' ] ]
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
            \ 'tabnum': 'Tab_num',
            \ 'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
            \ }
let g:lightline.component = {
            \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
            \ 'artify_mode': '%{Artify_lightline_mode()}',
            \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'vim_logo': "\ue7c5",
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
            \ 'linter_infos': 'lightline#ale#infos',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
            \ 'asyncrun_status': 'lightline#asyncrun#status',
            \ 'buffers': 'lightline#bufferline#buffers',
            \ 'gitdiff': 'lightline#gitdiff#get',
            \ }
let g:lightline.component_type = {
            \ 'linter_checking': 'right',
            \ 'linter_infos': 'right',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'right',
            \ 'buffers': 'tabsel',
            \ 'gitdiff': 'middle',
            \ }
" Productivity & Enhancement
let g:SuperTabDefaultCompletionType = '<C-n>'
" Close window if only a nerdtree is left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>t :NERDTreeToggle<CR>
map <Leader>b :TagbarToggle<CR><CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 1
" Plugin 'tjdevries/coc-zsh'
" Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
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
" Guide for leader press so you don't have to remember what's what
" Lines and etc for indentation
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_setColors = 0
let indentLine_color_term = 'lightgrey'
let indentLine_char = '|'
" Focused writing (GUI off)
let g:limelight_default_coefficient = 0.7
nnoremap <silent> <leader><space>f :<C-u>Limelight!!<CR>
let g:goyo_width = 95
let g:goyo_height = 85
let g:goyo_linenr = 0
augroup goyoCustom
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
augroup END
nnoremap <silent> <leader><space>r :<C-u>Goyo<CR>
" Resize windows to be a nice size
" Enable font switching per-token
" Configs for this are mostly in the functions section 
" Fuzzy search files, buffers, etc
let g:Lf_ShowDevIcons = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" Visualize Undos
" Git plugins
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
" Fast n pretty comments
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' },'python': { 'left': "'''",'right': "'''" } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" Inline editing: js within vue, etc
" Physics-based inertial scrolling
let g:comfortable_motion_scroll_down_key = "J"
let g:comfortable_motion_scroll_up_key = "K"
" Analyze slow plugins, etc
" Match parens, hotwords, etc
let g:loaded_matchit = 1
" Use vim for manpages
" Note you must also `export MANPAGER="vim -c MANPAGER -"`
" Insert closing symbols automatically
" Color json files better
au BufNewFile,BufRead *.json call VimJsonFormat()
" Color picker for inserting rgb colors
let g:vcoolor_lowercase = 1
let g:vcoolor_map = '<Leader>vcm'
let g:vcool_ins_rgb_map = '<Leader>rgb'
let g:vcool_ins_rgba_map = '<Leader>rgba'
let g:vcoolor_custom_picker = 'zenity --title "Picker" --color-selection'
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
autocmd BufNewFile,BufRead *.tsx,*.jsx filetype=typescript.tsx

" Linters & Checkers
let g:ale_completion_enabled = 0
let g:ale_c_parse_makefile = 1
let g:ale_linters = {'cpp': ['clang'], 'c': ['clang'], 'python': ['black', 'flake8', 'pylint', 'mypy'], 'json': ['jsonlint', 'fixjson']}
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

""" Completion
let python_highlight_all=1
nmap <Leader>ue :UltiSnipsEdit<cr>
set runtimepath+=~/.vim/bundle/UltiSnips/UltiSnips/
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips/UltiSnips/', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-s-tab>"
let g:UltiSnipsEditSplit="vertical"
" Previewers
let g:mkdp_browser="chromium-browser"
let g:mkdp_auto_start=1
let g:mkdp_auto_close=1
set updatetime=100
" To install black:
" apt install python3-venv
" pip3 install black
" python -m venv ~/.vim/black
" source ~/.vim/black/bin/activate
let g:black_virtualenv="~/.vim/black"
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }
let g:tagbar_type_moon = {
            \ 'ctagstype' : 'moonscript',
            \ 'kinds'     : [
            \ 'v:variables',
            \ 'f:functions',
            \ 'c:classes',
            \ 'm:methods',
            \ 's:static properties',
            \ 'p:properties',
            \ ]
            \}
let g:rainbow_active = 1

