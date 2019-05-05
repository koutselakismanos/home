"Plug auto-install
if 1
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

"Windows and Features
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
" " Plug 'scrooloose/syntastic'

"Motions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'yuttie/comfortable-motion.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
" " I Replaced vim-easymotion with vim-sneak
" " Plug 'easymotion/vim-easymotion'

"Language specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" " Plug 'mxw/vim-jsx'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'tellijo/vim-react-native-snippets'
" Plug 'hail2u/vim-css3-syntax'

"AutoCompletion
" Plug 'autozimu/LanguageClient-neovim', {
"  \ 'branch': 'next',
"  \ 'do': 'bash install.sh',
"  \ },
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'

Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  " Plug 'roxma/nvim-completion-manager'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"---------------------------------------------------------------------------------

""Gvim menu options and theme options
"set guioptions-=m "remove menu bar
"set guioptions-=T "remove toolbar
"set guioptions-=r "remove right-hand scroll bar
"set guioptions-=L "remove left-hand scrollbar
if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'UbuntuMono Nerd Font Mono')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif
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
set encoding=utf-8

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
set expandtab
" show existing tab with 4 spaces
" set tabstop=2
"when indending with > or <, use 4 spaces
set shiftwidth=2
set softtabstop=2 " number of spaces in tab when editing


"set smarttab
"set splitright
"set splitbelow

""Auto indentation smart and more strict c indentation
"set autoindent
"" set smartindent
"set cindent
"set copyindent

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
" set listchars=space:\|·,trail:·,extends:»,precedes:«,nbsp:×
" set listchars=space:·\,trail:·,extends:»,precedes:«,nbsp:×


nnoremap <F3> :set list!<CR>

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

"---------------------------------------------------------------------------------
"Leader
let mapleader = "\<space>"

"Split window navigation and settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Resize Windows
nnoremap <C-Up> 5<C-W>-
nnoremap <C-Down> 5<C-W>+
nnoremap <C-Right> 5<C-W>>
nnoremap <C-Left> 5<C-W><

nnoremap <F4> :NERDTreeToggle <CR>

nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>f :FZF<CR>

nnoremap <leader>; A;<ESC>

" nnoremap <leader><leader> <leader><leader>s
imap jk <ESC>
imap JK <ESC>

" Press enter or shift enter for new lines
" S-enter does not work in terminal Emulators, best used with gui intefaces
nnoremap <Enter> moo<Esc>`o
nnoremap <S-Enter> moO<Esc>`o

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
" nnoremap <leader>s :so %<CR> :noh<CR>

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
set foldlevelstart=0

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
  let onetab = strpart('            ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}

"Remap tab to %
" nnoremap <tab> %
nnoremap <leader><tab> %
vnoremap <leader><tab> %

"Keep search matches in the middle of the window and pulse the line when moving
nnoremap n nzzzv
nnoremap N Nzzzv

"Make sure vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \    execute 'normal! g`"zvzz' |
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

" Quick confi file editing
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>ei :tabe ~/.config/i3/config<CR>
nnoremap <leader>ez :tabe ~/.zshrc<CR>

" Sneak mode
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S

"--------------------------------------------------------------------------------
""Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:Powerline_symbols='unicode'
"let g:airline_left_sep = "\uE0B0"
"let g:airline_right_sep = "\uE0B2"

"let g:airline_theme='dark'
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_symbols_ascii = 1
"let g:airline_section_z = airline#section#ceeate(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
"------You Complete me settings---------------------------------------------------
"You complete me and ultisnips settings
" let g:ycm_global_ycm_extra_conf= '~/.vim/.ycm_global_ycm_extra_conf.py'
" set completeopt-=preview
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_echo_current_diagnostic = 0

" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

"---------------------------------------------------------------------------------

"Nerdtree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"-------------------------------------------------------------------
" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"---------------------------------------------------------------------------------
"Deoplete
let g:deoplete#enable_at_startup=1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


" Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ '...'
  \ ]
"----------------------------------------
" Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" Required for operations modifying multiple buffers like rename.
set hidden
set completefunc=LanguageClient#complete

let g:LanguageClient_rootMarkers = {
  \ 'go': ['.git', 'go.mod'],
  \ }

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'python': ['pyls'],
  \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
  \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
  \ 'go': ['go-langserver', '-diagnostics', '-gocodecompletion', '-lint-tool',  'golint'],
  \ }

nnoremap <F6> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>

"---------------------------------------------------------------------------------
" Run specific language and compile it
augroup run
  autocmd filetype c nnoremap <silent><F5> :w <CR>k :split term://gcc % && ./a.out <CR> i
  autocmd filetype cpp nnoremap <silent><F5> :w <CR>k :split term://g++ % && ./a.out <CR> i
  autocmd filetype python nnoremap <silent><F5> :w <CR>k :split term://python % <CR> i
  autocmd filetype php nnoremap <silent><F5> :w <CR>k :split term://php % <CR> i
  autocmd filetype go nnoremap <silent><F5> :w <CR>k :split term://go run % <CR> i
augroup end

"---------------------------------------------------------------------------------
