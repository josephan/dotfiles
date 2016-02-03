set nocompatible
filetype off

set noswapfile
set number
set noswapfile
set autoindent
set hlsearch
set ignorecase
set smartcase

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " automatic formatting
  autocmd BufWritePre *.slim,*.rb :%s/\s\+$//e

augroup END

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/a.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/SearchComplete'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

syntax on
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set number
colorscheme Tomorrow-Night-Eighties

vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>ts :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Lookup current word
nnoremap gl :OnlineThesaurusCurrentWord<CR>

nnoremap <leader>aa :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>at :AT<CR>

map <leader>gb :Gblame<CR>

nmap gb :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap g/ :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>
noremap <Tab> <c-w><c-w>
noremap <S-Tab> <c-w>w
noremap <Leader>s :update<CR>

set splitbelow
set splitright

if executable("ag")
   let g:ackprg = 'ag --nogroup --nocolor --column'

   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor\ -U

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U --hidden'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = {
           \ 'dir': 'bower_components\|build\|dist\|docs\|export\|node_modules\|DS_Store\|git',
           \ 'file': '\.meta$'
           \ }

let g:rspec_command = "!bundle exec rspec -f d -c {spec}"
nmap <silent> z/ :nohlsearch<CR>
nmap zh ^
nmap zl $
vmap zh ^
vmap zl $
