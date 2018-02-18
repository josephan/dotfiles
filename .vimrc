" Plug setup
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

Plug 'rakr/vim-one'
Plug 'robertmeta/nofrils'

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/SearchComplete'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rhubarb'

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'pbrisbin/vim-mkdir'
Plug 'alvan/vim-closetag'
Plug 'craigemery/vim-autotag'

Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'mhinz/vim-mix-format'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

Plug 'janko-m/vim-test'
Plug 'suan/vim-instant-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'jparise/vim-graphql'

call plug#end()
" Plug setup ends here

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
colorscheme one
set background=dark

syntax enable

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disables autocomment on newline

" Inserts a newline and indent
inoremap <leader><CR> <CR><C-o>==<C-o>O
set tabstop=2      " number of visual spaces per TAB
set softtabstop=2  " number of space in tab when editing 
set shiftwidth=2   " number of spaces with reindent operations
set linespace=1    " number of pixels inbetween each line
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
let NERDTreeIgnore=['\.DS_Store$']
let g:NERDTreeChDirMode=2

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
autocmd FileType python set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround

" javascript prettier and jsx config
let g:jsx_ext_required = 0
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin

if executable("ag")
   let g:ackprg = 'ag --nogroup --nocolor --column'

   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor\ -U

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U --hidden'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
           \ 'dir': '_build\|_site\|tmp\|deps\|coverage\|bower_components\|build\|dist\|docs\|export\|node_modules\|DS_Store\|git\|priv\/static$',
           \ 'file': '\.meta$'
           \ }

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

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

" YouCompleteMe configs
let g:ycm_autoclose_preview_window_after_insertion = 1

" Ultisnips and YouCompleteMe plays nice
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

let g:UltiSnipsJumpForwardTrigger="<c-b>"

" ctags config
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

let g:mix_format_on_save = 1
