{ lib }:

{
  customRC = (lib.strings.concatStringsSep "\n" [
    ''
      " GLOBAL VIMRC VARS
      let g:which_key_map = {}
      let g:lightline = {}
      let g:lightlineArtify = 1
    ''

    ''
      " KEY MAPPINGS
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
    ''

    ''
      " GENERAL SETTINGS
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
    ''

    (builtins.readFile ./plugins-config.vim)

    ''
      " VIM FUNCTIONS

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
                          \substitute(expand('%:p:h'), '\:', '~', ''')
          else
              let l:backupdir=$HOME.'/.vim/backup/'.
                          \substitute(expand('%:p:h'), '^'.$HOME, '~', ''')
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
          return get(b:, 'coc_current_function', ''')
      endfunction
      function! Devicons_Filetype()
          " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : '''
          return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : '''
      endfunction
      function! Devicons_Fileformat()
          return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : '''
      endfunction
      function! Artify_active_tab_num(n) abort
          return Artify(a:n, 'bold')." \ue0bb"
      endfunction
      function! Tab_num(n) abort
          return a:n." \ue0bb"
      endfunction
      function! Gitbranch() abort
          if gitbranch#name() !=# '''
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
          if gitbranch#name() !=# '''
              return Artify(gitbranch#name(), 'monospace')." \ue725"
          else
              return "\ue61b"
          endif
      endfunction
      function! NERDTreeStart()
        if !argc() && !exists("s:std_in")
          NERDTree
        end
        if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
          exe 'NERDTree' argv() [0]
          wincmd p
          ene
        end
      endfunction
    ''

    ''
      " AUTO COMMANDS
      "Set highlight after 80 for C/C++ & 120 for python
      autocmd BufRead,BufNewFile * set colorcolumn=120
      autocmd BufRead,BufNewFile * highlight ColorColumn ctermbg=lightgrey
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
        autocmd BufWritePost * call lightline#gitdiff#get() | call lightline#update()
      augroup END
      " Start nerdtree on vim with no file or vim directory
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * call NERDTreeStart()

    ''
  ]);
}


