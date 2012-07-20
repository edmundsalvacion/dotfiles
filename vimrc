" general must haves
set nocompatible
filetype off
filetype plugin indent on
runtime! macros/matchit.vim

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'rstacruz/sparkup'
Bundle 'tpope/vim-surround'
Bundle 'sjl/gundo.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'skwp/vim-ruby-conque'

" tab me
set tabstop=2
set shiftwidth=2
set expandtab

" make awesomer
set modelines=0
set noswapfile
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set mouse=a
cmap W w
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :GundoToggle<CR>

" wildmenu
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>
set wildcharm=<C-Z>
nnoremap <F13> :b <C-Z>

" pimp my status line
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ %{fugitive#statusline()}   " fugitive
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" tame searching
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ack<space>
nnoremap <leader>d obinding.pry<esc>
nnoremap <tab> %
vnoremap <tab> %
nmap <silent> <leader>cd :cd %:p:h<cr>

" handle columns
set wrap
set textwidth=79
set formatoptions=qrn1

" movement
set whichwrap=b,s,<,>,[,]

" colors and themes
syntax on
colorscheme ir_black
set t_Co=256
hi Pmenu ctermbg=238 gui=bold

" gui specific items
if has("gui_running")
    set colorcolumn=100
    set guioptions=egmrt
    set guifont=Monaco:h13
    colorscheme mustang
endif

" always open nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd BufEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
