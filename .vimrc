set nocompatible              " be iMproved
filetype off                  " required!

let mapleader = ','
if has('vim_starting')
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoNeoBundleFetch manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'gmarik/vundle'
NeoBundle 'ag.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'itchyny/lightline.vim'

" Colorschemes
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Solarized'
NeoBundle 'molokai'
NeoBundle 'morhetz/gruvbox'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'itchyny/landscape.vim'
"
NeoBundle 'Tabular'
NeoBundle 'matchit.zip'
NeoBundle 'Puppet-Syntax-Highlighting'
NeoBundle 'leshill/vim-json'
NeoBundle 'editorconfig-vim'
" Syntax
NeoBundle 'chase/vim-ansible-yaml'
" Vim Bare Bones
set path=**
set suffixesadd=.rb,.yml,.js
set nocompatible
set wildmode=full
set wildmenu

" allow plugins by file type
filetype on
filetype plugin on
filetype indent on
" filetype plugin indent on     " required!

" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" always show status bar
set ls=2

" incremental search
set incsearch "Highlight as you type
set hidden    "Handle multiple buffers better
set ignorecase " Case-insensitive searching.
set smartcase " But case-sensitive if expression contains a capital letter.
set swapfile
set directory=~/tmp,/var/tmp,/tmp

" highlighted search results
set hlsearch

" line numbers
set number

syntax on

set t_Co=256
scriptencoding utf-8
set encoding=utf-8


autocmd FileType pp :set ft=ruby

" After write, remove trailling whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Remove scrollbars
set guioptions=aei

set backspace=indent,eol,start

" My NeoBundleFetchs here:
" Refer to |:NeoNeoBundleFetch-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme landscape
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"      \ },
"      \ 'separator': { 'left': '⮀', 'right': '⮂' },
"      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"      \ }
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
"      \ },
"      \ 'separator': { 'left': '⮀', 'right': '⮂' },
"      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"      \ }

"""" lightline.vim""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"
au BufRead,BufNewFile *.go set filetype=go



