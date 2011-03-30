set nocompatible " Turn off vi compatibility - don't need it

" PLUGINS
"" Pathogen
filetype on        " Bypass strange error in combination with git
filetype off              
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax highlighting 'n stuff
syntax on
filetype on
filetype indent on
filetype plugin on

" EDITOR BEHAVIOR
set autoread       " Automatically reload file if changed outside of vim
set number         " Line numbers
set autoindent     " Autoindenting always on
set copyindent     " Copy previous indentation
set ignorecase     " Ignore case when searching
set smartcase      " Ignore case if search pattern is all lowercase,
set hlsearch       " Highlight search terms 
set incsearch      " Show search matches as you type 
set gdefault       " Search/replace globally (on a line) by default

"" Better regex behavior - not for me...
" nnoremap / /\v
" vnoremap / /\v

" Tabs
set smarttab
set tabstop=4
set shiftwidth=4
set smarttab      

"" Encoding
set termencoding=utf-8
set encoding=utf-8

"" Make sure bash is the default shell
set shell=/bin/bash

"" Put all swap file in one place
set directory^=$HOME/.tmp/

"" Use undo files
if v:version >= 730
	set undofile
	set undodir^=$HOME/.tmp/
endif

" VISUAL STUFF
set guioptions-=T  " Disable the toolbar (GUI only)
set mouse=a        " Enable mouse (if terminal supports it)
set showcmd        " Show partial command in the last line
set showmode       " Show mode in the last line
set wildmenu       " Command-line completion
set title          " Change the terminal's title
set showmatch      " Set show matching parenthesis
set nomodeline     " Disable mode lines

"" Invisible chars
set listchars=tab:▸\ ,eol:¬
set nolist         " Don't show invisible chars by default

" Colors
colorscheme sunburst " Use sunburst theme (extracted from TextMate)
hi SpellBad term=reverse ctermfg=White ctermbg=Red gui=undercurl guisp=Red

" Status line
let g:rails_statusline=0                     " Disable vim-rails info

set laststatus=2
set statusline=
set statusline+=%-3.3n |                     " buffer number
set statusline+=%f |                         " filename
set statusline+=%h%m%r%w |                   " status flags
set statusline+=%*%=                         " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P

" KEY MAPPINGS
"" Leader
let mapleader=","
let g:mapleader=","

"" More favorable behavior of wrapped lines
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

"" Delete lines with dd without adding them to the yank stack
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

"" Quick yanking to the end of the line
nmap Y y$

"" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

"" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+yy
nmap <leader>Y "+Y
nmap <leader>p "+gP
nmap <leader>P "+P

"" Make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"" Write as sudo
cmap w!! w !sudo tee % >/dev/null

"" NERDTree
map <Leader>n :NERDTreeToggle<cr>

"" Autocomplete list
inoremap <Leader><tab> <c-n>
inoremap <c-space> <c-x><c-o>
inoremap <nul> <c-x><c-o>
set completeopt=menu,preview,longest

