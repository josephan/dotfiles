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

Plugin 'sheerun/vim-polyglot'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/a.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'avdgaag/vim-phoenix'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

autocmd FileType python set textwidth=79|set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround

syntax on
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set background=dark

set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=e
set gfn=Menlo:h14
set cursorline 

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
if has("gui_macvim")
  colorscheme onedark
  let g:rspec_runner = "os_x_iterm"
  let g:rspec_command = "bundle exec rspec -f d -c {spec}"
else
  colorscheme onedark
  let g:rspec_runner = "os_x_iterm"
  let g:rspec_command = "bundle exec rspec -f d -c {spec}"
endif
" Lookup current word
nnoremap gl :OnlineThesaurusCurrentWord<CR>

nnoremap <leader>aa :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>at :AT<CR>

map <leader>gb :Gblame<CR>

nmap gb :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap g/ :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>
noremap <Tab> <c-w><c-w>
noremap <S-Tab> <c-w>w
noremap <Leader>s :update<CR>
nnoremap zr :CtrlPMRUFiles<CR>

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
           \ 'dir': 'deps\|bower_components\|build\|dist\|docs\|export\|node_modules\|DS_Store\|git',
           \ 'file': '\.meta$'
           \ }

let g:user_emmet_leader_key='<C-Z>'

let g:jsx_ext_required = 0

nmap <silent> z/ :nohlsearch<CR>
nmap zh ^
nmap zl $
vmap zh ^
vmap zl $

nmap gr gT

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
 \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
 \gvy/<C-R><C-R>=substitute(
 \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
 \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
 \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
 \gvy?<C-R><C-R>=substitute(
 \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
 \gV:call setreg('"', old_reg, old_regtype)<CR>

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

imap <C-o> <esc>o

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
