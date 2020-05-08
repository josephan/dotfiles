" Plug setup
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'robertmeta/nofrils'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'

Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'

Plug 'pbrisbin/vim-mkdir'
Plug 'alvan/vim-closetag'
" Plug 'Chiel92/vim-autoformat'

" elixir/phoenix related plugins
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'mhinz/vim-mix-format'

" ruby/rails related plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'janko-m/vim-test'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" javascript related plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'OmniSharp/omnisharp-vim'

Plug 'dense-analysis/ale'

call plug#end()
" Plug setup ends here


" Colorscheme
colorscheme one
set background=dark
" au VimEnter * colorscheme one

syntax enable

" True color support for iTerm2 for one
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disables autocomment on newline

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Inserts a newline and indent
inoremap <leader><CR> <CR><C-o>==<C-o>O
set tabstop=2      " number of visual spaces per TAB
set softtabstop=2  " number of space in tab when editing
set shiftwidth=2   " number of spaces with reindent operations
set linespace=3    " number of pixels inbetween each line
set expandtab      " turns TAB into spaces
set noswapfile     " disables .swp files being created

" autoreloads file when changed in disk
set autoread
au CursorHold * checktime

set number         " show line numbers"
set showcmd        " show command in bottom bar"
set cursorline     " highlight current line"
filetype indent plugin on " load filetype-specific indent files

set wildmenu       " visual autocomplete for command menu
set lazyredraw     " redraw only when we need to
set showmatch      " highlight matching brackets

set incsearch      " search as characters are entered
set hlsearch       " highlight matches

" turn off search higlight
nmap <silent> z/ :nohlsearch<CR>

" Switch between split views
noremap <Tab> <c-w><c-w>
noremap <S-Tab> <c-w>h

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $
vmap B ^
vmap E $

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
autocmd! GUIEnter * set vb t_vb= " Disables bell

set guifont=Inconsolata:h13

" file specific vim configs
" Python
autocmd FileType python set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround

" Elm
autocmd FileType elm set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround

" C# csharp omnisharp
autocmd FileType cs set shiftwidth=4|set tabstop=4|set softtabstop=4|set shiftround
let g:OmniSharp_timeout = 5
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:OmniSharp_server_use_mono = 1


" prettier
nmap <Leader>[ <Plug>(Prettier)

" fzf (ctrlp)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_layout = { 'down': '~20%' }
nnoremap <silent> <C-p> :Files<cr>

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
      \  'javascript' : {
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

" Fix coc.nvim and endwise conflicts
let g:endwise_no_mappings=1

" vim-test configs
" make test commands execute using iTerm2
let test#strategy = "iterm"
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

inoremap <leader>a <C-o>A

" vim-sneak
map t <Plug>Sneak_s
map T <Plug>Sneak_S

" ack config
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ -U
endif

nnoremap <Leader>a :Ack!<Space>

" format elixir files on save
let g:mix_format_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim setup
""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <C-]> <Plug>(coc-definition)
nmap <C-\> :vsp <CR><Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" let g:coc_node_path = '/tmp/fnm-shell-7405821/bin/node'
let g:coc_global_extensions=['coc-omnisharp', 'coc-css', 'coc-elixir', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-solargraph', 'coc-snippets']
