"Plug auto-install
if 0
  if(!isdirectory(expand("~/.config/nvim/autoload/plug.vim")))
    call system(expand("mkdir -p ~/.config/nvim/autoload"))
    call system(expand("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"))
  endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Apperance
Plug 'flazz/vim-colorschemes'
Plug 'powerline/fonts'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'blueshirts/darcula'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'

"Windows and Features
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

"Motions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'markonm/traces.vim'

"Language specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'

"AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

"---------------------------------------------------------------------------------

""Gvim menu options and theme options
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'UbuntuMono Nerd Font Mono')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scrollbar
set guifont=FuraCode\ Nerd\ Font\ 11
set termguicolors
" let ayucolor="mirage"
" let ayucolor="light"
" colorscheme ayu
set background=dark
colorscheme gruvbox

" Colorize line numbers in insert and visual modes
"---------------------------------------------------------------------------------
function! Setcursorlinenrcolorinsert(mode) abort
  " insert mode: blue
  if a:mode == "i"
    highlight cursorlinenr ctermfg=10 guifg=green
    highlight cursor ctermbg=10 guibg=green

    " replace mode: red
  elseif a:mode == "r"
    highlight cursor ctermbg=1 guibg=#dc322f
    highlight cursorlinenr ctermfg=1 guifg=#dc322f
  endif
endfunction

function! Resetcursorlinenrcolor() abort
  set updatetime=4000
  highlight cursorlinenr ctermfg=4 guifg=#268bd2
  highlight cursor ctermbg=4 guibg=#268bd2
endfunction

augroup cursorlinenrcolorswap
  autocmd!
  autocmd insertenter * call Setcursorlinenrcolorinsert(v:insertmode)
  autocmd insertleave * call Resetcursorlinenrcolor()
  autocmd cursorhold * call Resetcursorlinenrcolor()
augroup END

"---------------------------------------------------------------------------------

set encoding=UTF-8
set backupdir=~/.vim/tmp " for the backup files
set directory=~/.vim/tmp " for the swap files

"on search highlight instances
set hlsearch

"ex mode command completion
set wildmenu

"search ignore capital letters
set ignorecase
set smartcase

"complete search pattern by pressing enter and cancel with esc
set incsearch

"display line number
set number

"display line relative to position
set relativenumber

"mouse cursor in terminal
set mouse=a

"better clipboard
set clipboard+=unnamedplus

"each time a new or existing file is edited,
"vim will try to recognize the type of the file and set the 'filetype' option.
"this will trigger the filetype event, which can be used to set the syntax highlighting,
"set options, etc.
filetype plugin indent on
syntax on
autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"doesn't wrap lines
set nowrap
"convert tab to spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set splitright

""Auto indentation smart and more strict c indentation
"set autoindent
"" set smartindent
"set cindent
set copyindent

"Show commands/letters i'm typing
set showcmd

set backspace=indent,eol,start
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set pastetoggle=<F2>

"Guide lines
set list
set listchars=trail:-,space:·

set clipboard+=unnamedplus
nnoremap <F3> :set list!<CR>

" " convert spaces to tabs when reading file
" autocmd! bufreadpost * set noexpandtab | retab! 2

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 2
" " convert spaces to tabs after writing file (to show guides again)
" autocmd! bufwritepost * set noexpandtab | retab! 2

"---------------------------------------------------------------------------------
"Leader
let mapleader = "\<space>"

"Split window navigation and settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-Tab> gt
map <C-S-Tab> gT

"Resize Windows
nnoremap <C-Up> 5<C-W>-
nnoremap <C-Down> 5<C-W>+
nnoremap <C-Right> 5<C-W>>
nnoremap <C-Left> 5<C-W><

function! NerdTreeToggler()
  if &filetype == 'nerdtree'
    :NERDTreeToggle
  elseif &filetype == ''
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction


" map <F4> :Explore<CR>
map <F4> :call NerdTreeToggler()<CR>
map <S-F4> :NERDTreeToggle<CR>

nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" FZF----------
nmap <C-p> :GFiles<CR>
nmap <leader>f :Files<CR>

nmap <leader>b :Buffers<CR>

nmap <leader>H :History<CR>
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>

nmap <leader>C :Commands<Cr>

nmap <leader>M :Maps<CR>

nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

nmap <C-S-f> :Ag<Space>
" -------------

nnoremap <leader>; A;<ESC>

" nnoremap <leader><leader> <leader><leader>s
imap jk <ESC>
imap JK <ESC>

" Flip buffers with arrow keys
nnoremap <expr> <right> (len(filter(range(0, bufnr('$')), 'buflisted(v:val)')) > 1 ? ":bn\<cr>" : "\<right>")
nnoremap <expr> <left> (len(filter(range(0, bufnr('$')), 'buflisted(v:val)')) > 1 ? ":bp\<cr>" : "\<left>")

" Insert mode delete like most text editors
imap <C-Backspace> <C-w>

"arrow keys keybindings
" Commented out because of accidental presses
" nnoremap <UP> ddkP
" nnoremap <DOWN> ddp

" Clear highlights
nnoremap <leader>h :noh<CR>

" " Source file
nnoremap <leader>s :so %<CR> :noh<CR>

" Emmet plugin
imap jj <C-y>,

" Asterisk highlighting
nnoremap * *<C-o>

" Better highlight while in v-mode
function! s:VsetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VsetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VsetSearch()<CR>??<CR><c-o>

"Folding-------- }}}
set foldlevelstart=1

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('  ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}

"Keep search matches in the middle of the window and pulse the line when moving
nnoremap n nzzzv
nnoremap N Nzzzv

"Make sure vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \  execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"Better copy paste
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>Y "+y
nnoremap <leader>P "+p

vnoremap <C-c> "+y
vnoremap <C-v> "+p
imap <C-v> <C-o>"+p

" Quick confi file editing
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>ei :tabe ~/.config/i3/config<CR>
nnoremap <leader>ez :tabe ~/.zshrc<CR>

" Sneak mode
" nmap <leader>s <Plug>Sneak_s
" nmap <leader>S <Plug>Sneak_S

"---------------------------------------------------------------------------------
"Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols='unicode'
" let g:airline_left_sep = "\uE0B0"
" let g:airline_right_sep = "\uE0B2"

" let g:airline_theme='dark'
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_symbols_ascii = 1
" let g:airline_section_z = airline#section#ceeate(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
"---------------------------------------------------------------------------------
" " Ale
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" let g:ale_fixers = {
" \  'javascript': ['eslint'],
" \}
"---------------------------------------------------------------------------------
"Nerdtree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"---------------------------------------------------------------------------------
" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"---------------------------------------------------------------------------------
""Deoplete
"let g:deoplete#enable_at_startup=1

"" Whether to include the types of the completions in the result data. Default: 0
"let g:deoplete#sources#ternjs#types = 1

"" Whether to include the distance (in scopes for variables, in prototypes for
"" properties) between the completions and the origin position in the result
"" data. Default: 0
"let g:deoplete#sources#ternjs#depths = 1

"" Whether to include documentation strings (if found) in the result data.
"" Default: 0
"let g:deoplete#sources#ternjs#docs = 1

"" When on, only completions that match the current word at the given point will
"" be returned. Turn this off to get all results, so that you can filter on the
"" client side. Default: 1
"let g:deoplete#sources#ternjs#filter = 0

"" Whether to use a case-insensitive compare between the current word and
"" potential completions. Default 0
"let g:deoplete#sources#ternjs#case_insensitive = 1

"" When completing a property and no completions are found, Tern will use some
"" heuristics to try and return some properties anyway. Set this to 0 to
"" turn that off. Default: 1
"let g:deoplete#sources#ternjs#guess = 0

"" Determines whether the result set will be sorted. Default: 1
"let g:deoplete#sources#ternjs#sort = 0

"" When disabled, only the text before the given position is considered part of
"" the word. When enabled (the default), the whole variable name that the cursor
"" is on will be included. Default: 1
"let g:deoplete#sources#ternjs#expand_word_forward = 0

"" Whether to ignore the properties of Object.prototype unless they have been
"" spelled out by at least two characters. Default: 1
"let g:deoplete#sources#ternjs#omit_object_prototype = 0

"" Whether to include JavaScript keywords when completing something that is not
"" a property. Default: 0
"let g:deoplete#sources#ternjs#include_keywords = 1

"" If completions should be returned when inside a literal. Default: 1
"let g:deoplete#sources#ternjs#in_literal = 0


"" Add extra filetypes
"let g:deoplete#sources#ternjs#filetypes = [
"  \ 'jsx',
"  \ 'javascript.jsx',
"  \ 'vue',
"  \ '...'
"  \ ]
"---------------------------------------------------------------------------------
" " Automatically start language servers.
" " let g:LanguageClient_autoStart = 1

" " Required for operations modifying multiple buffers like rename.
" set hidden
" set completefunc=LanguageClient#complete

" let g:LanguageClient_rootMarkers = {
" \ 'go': ['.git', 'go.mod'],
" \ }

" let g:LanguageClient_serverCommands = {
" \ 'javascript': ['javascript-typescript-stdio'],
" \ 'python': ['pyls'],
" \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
" \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
" \ 'go': ['go-langserver', '-diagnostics', '-gocodecompletion', '-lint-tool',  'golint'],
" \ }

" nnoremap <F6> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>

"---------------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" function! RemoveTrailingWhitespace()
"   :%s/\s+$//g
" endfunction
"---------------------------------------------------------------------------------
" Coc

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
" set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>lr <Plug>(coc-rename)

"---------------------------------------------------------------------------------
" Plugin: GitGutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'

autocmd BufWritePost * GitGutter


"--------------------------------------------------------------------------------
" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<NUL>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"--------------------------------------------------------------------------------

" Run specific language and compile it
augroup run
  autocmd filetype c nnoremap <silent><F5> :w <CR>k :split term://gcc % && ./a.out <CR> i
  autocmd filetype cpp nnoremap <silent><F5> :w <CR>k :split term://g++ % && ./a.out <CR> i
  autocmd filetype python nnoremap <silent><F5> :w <CR>k :split term://python % <CR> i
  autocmd filetype php nnoremap <silent><F5> :w <CR>k :split term://php % <CR> i
  autocmd filetype go nnoremap <silent><F5> :w <CR>k :split term://go run % <CR> i
augroup end

