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
Bundle 'tpope/vim-markdown'
Bundle 'bkad/CamelCaseMotion'
Bundle 'endel/vim-github-colorscheme'
Bundle 'noahfrederick/Hemisu'
Bundle 'Lokaltog/powerline'

" disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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
command Sudow w !sudo tee % > /dev/null
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :GundoToggle<CR>

" wildmenu
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>
set wildcharm=<C-Z>
nnoremap <F13> :b <C-Z>

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

" colors and themes
syntax on
colorscheme ir_black
set t_Co=256
hi Pmenu ctermbg=238 gui=bold

" gui specific items
if has("gui_running")
    set colorcolumn=100
    set guioptions=egmrt
    set guifont=Monaco\ for\ Powerline:h13
    colorscheme mustang
endif

" powerline
set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" always open nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd BufEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" git stuff
augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap  P :Pick
  nnoremap  E :Edit
  nnoremap  R :Reword
  nnoremap  S :Squash
  nnoremap  F :Fixup
  nnoremap  C :Cycle
endfun
