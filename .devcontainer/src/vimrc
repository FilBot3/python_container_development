" vimrc

" Spell Checking
set spell spelllang=en_us

" New Vertical Splits go to the right
set splitright
" New Horizontal Splits go to the bottom
set splitbelow

" Make Vim do modern magic.
set nocompatible

" Make backspaces work
set backspace=indent,eol,start

" Set a visual ruler
set colorcolumn=80

" Visual Spaces per TAB
set tabstop=2
" Number of spaces in TAB when editing
set softtabstop=2
" Makes TABs spaces instead
set expandtab
" Make indentations smarter
set shiftwidth=2

" Netrw list style
" :help liststyle
let g:netrw_liststyle = 3

" Load Pathogen
"execut pathogen#infect()
" We're using the Vim 8 Package Directory option.
" :help packages

" Remove Trailing Whitespace on Document Save
autocmd BufWritePre * %s/\s\+$//e

" Enable syntax processing
syntax on

" Colorschemes
colorscheme deus

" Show Line Numbers
set number

" Show Relative Line Numbers
set relativenumber

" Show the command in the bottom bar
set showcmd

" Highlight current line
set cursorline

" Load filetype-specific indent files
filetype indent plugin on

" Folding
set foldenable

" indent wrapped lines
set breakindent

" Redraw the screen only when neded
set lazyredraw

" Show matching brackets/braces
set showmatch

" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Ignore Case Sensitivity
set ignorecase
" Make searching smarter
set smartcase

" vim-airline Tabline
try
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
endtry

" vim-session Don't ask everytime
try
  let g:session_autosave = 'no'
endtry

" Display the files we tab complete
set wildmenu

" Set our Vim's search path so we can easily find files.
"set path+=**

" Make ctags tags file. Will need to have ctags installed to use.
command! MakeTags !ctags -R .

" gVIM Settings can go here.
if has("gui_running")
  " gVIM Specifics here.
  "
  " Load ConqueGDB, gVim needs it more.
  " Still busted. Probably never going to be fixed.
  "packadd conque-gdb
endif

" vim-polyglot Settings
try
  let g:polyglot_disabled = ['latex', 'terraform']
endtry

" vim-syntastic
try
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endtry

" Allow loading of project specific .vimrc
set exrc
" Disable unsafe commands unless owned by me.
set secure

" vim-terraform
try
  let g:terraform_fmt_on_save=1
endtry

try
  let g:OmniSharp_server_stdio = 1
endtry

" CtrlP
try
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|.yardoc\|node_modules\|log\|tmp$\|venv\|dist\|bundle',
    \ 'file': '\.so$\|\.dat$\|\.DS_Store$'
    \ }
  if exists('g:ctrlp_user_command')
    unlet g:ctrlp_user_command
  endif
endtry

" rust.vim
try
  let g:rustfmt_autosave = 1
endtry

" ALE key bindings
try
  nmap <silent> <leader>aj :ALENext<cr>
  nmap <silent> <leader>ak :ALEPrevious<cr>
endtry

" vim-go
try
  "
endtry

" tpope/vim-markdown
try
  let g:markdown_folding = 1
  au FileType markdown setlocal foldlevel=99
endtry

try
  "au FileType yaml,yml
endtry

" Goyo.vim
try
  let g:goyo_width = 86
endtry
