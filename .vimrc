" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'

" Declare the list of plugins.

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set splitbelow
set splitright
set hlsearch
set incsearch
set encoding=UTF-8
set mouse=a
colorscheme nord

if has('gui_running')
  set guifont=Hack\ 9
endif

syntax on
filetype plugin indent on
filetype on
filetype indent on




nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
