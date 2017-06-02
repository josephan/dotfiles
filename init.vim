set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'VundleVim/Vundle.vim'

Plug 'joshdick/onedark.vim'

Plug 'vim-scripts/a.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

Plug 'janko-m/vim-test'
Plug 'suan/vim-instant-markdown'
Plug 'Omnisharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'

call plug#end()
filetype plugin indent on

" True color support for iTerm2 for one
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Colorscheme
colorscheme onedark
set background=dark

syntax enable
syntax on

set tabstop=2      " number of visual spaces per TAB
set softtabstop=2  " number of space in tab when editing 
set shiftwidth=2   " number of spaces with reindent operations
set expandtab      " turns TAB into spaces
set noswapfile     " disables .swp files being created

set number         " show line numbers"
set showcmd        " show command in bottom bar"
set cursorline     " highlight current line"
filetype indent on " load filetype-specific indent files

set wildmenu       " visual autocomplete for command menu
set lazyredraw     " redraw only when we need to
set showmatch      " highlight matching brackets

set incsearch      " search as characters are entered
set hlsearch       " highlight matches

" turn off search higlight
nmap <silent> z/ :nohlsearch<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" writes to file
noremap <Leader>s :update<CR>

" Switch tabs
nmap gr gT

" ctrl-o in insert mode
imap <C-o> <esc>o

" Copy and Pasting
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P

" Switch between split views
noremap <Tab> <c-w><c-w>
noremap <S-Tab> <c-w>w

" NERDTree configuration
nmap gb :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 22 
let NERDTreeIgnore = ['\.DS_Store$']

" MacVim configs
set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=e
set gfn=Menlo:h16
autocmd! GUIEnter * set vb t_vb= " Disables bell

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" file specific vim configs
" Python
autocmd FileType python set textwidth=79|set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround

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
           \ 'dir': 'deps\|bower_components\|build\|dist\|docs\|export\|node_modules\|DS_Store\|git\|priv\/static$',
           \ 'file': '\.meta$'
           \ }

let g:user_emmet_leader_key='<C-Z>'

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

" Dont auto open markdown files
let g:instant_markdown_autostart = 0

" vim-test configs
" make test commands execute using iTerm2
let test#strategy = "iterm"
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Tan for deoplete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" neoformat config
autocmd BufWritePre *.js Neoformat
