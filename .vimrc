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
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
Plug 'ngmy/vim-rubocop'
" Plug 'garbas/vim-snipmate'
" Plug 'valloric/youcompleteme'

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
colorscheme gruvbox
set background=dark    " Setting dark mode

if has('gui_running')
  set guifont=Hack\ 9
endif

syntax on
filetype plugin indent on
filetype on
filetype indent on

set omnifunc=syntaxcomplete#Complete

let g:javascript_plugin_flow = 1
" let g:javascript_plugin_jsdoc = 1


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
nmap <F8> <Plug>(ale_fix)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight LineNr ctermbg=none

set shell=bash\ -l

let g:ale_linters = { 'ruby': ['standardrb', 'rubocop'] }

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

