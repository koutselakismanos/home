if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
" Customization
" Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'


" Useful
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
Plug 'markonm/traces.vim'
Plug 'scrooloose/nerdtree'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

vnoremap <C-c> "+y
vnoremap <C-v> "+p
imap <C-v> <C-o>"+p

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

"
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set mouse=a

" Add semicolon in the end of the file
nnoremap <leader>; A;<ESC>

" Add comma in the end of the file
nnoremap <leader>, A,<ESC>

" nnoremap <leader><leader> <leader><leader>s
imap jk <ESC>
imap JK <ESC>


nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

map <C-Tab> gt
map <C-S-Tab> gT

" Asterisk highlighting
nnoremap * *<C-o>

" Insert mode delete like most text editors
imap <C-BS> <C-w>

"Keep search matches in the middle of the window and pulse the line when moving
nnoremap n nzzzv
nnoremap N Nzzzv

" Clear highlights
nnoremap <leader>h :noh<CR>

"Easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"Better copy paste
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>Y "+y
nnoremap <leader>P "+p

" Press enter or shift enter for new lines
" S-enter does not work in terminal Emulators, best used with gui intefaces
nnoremap <Enter> moo<Esc>`o
nnoremap <S-Enter> moO<Esc>`o

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

set number
set relativenumber

set nowrap

"ex mode command completion  
set wildmenu  

"complete search pattern by pressing enter and cancel with esc  
set incsearch 

"search ignore capital letters  
set ignorecase  
set smartcase 

set splitright  

" Sneak mode
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S

" Guide lines
set list
set listchars=trail:-,space:·

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Show commands/letters i'm typing
set showcmd

"on search highlight instances  
set hlsearch  

set backspace=indent,eol,start
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set pastetoggle=<F2>

""Gvim menu options and theme options
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scrollbar
set guioptions-=e "remove gui tabs
set belloff=all

set termguicolors
let ayucolor="mirage"
colorscheme ayu
" set background=light
" colorscheme onedark
set guifont=Ubuntu\ Mono\ 13


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
" Emmet
imap jj <C-y>,

" FZF Fuzzy file key maps
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>

nmap <leader>b :Buffers<CR>

nmap <leader>t :BTags<CR>

nmap <leader>a :Ag<Space>

nmap <leader>H :History<CR>
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>

nmap <leader>M :Maps<CR>

nmap <leader>C :Commands<CR>

" Coc
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

""Close preview window when completion is done.
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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

" Plugin: GitGutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'

autocmd BufWritePost * GitGutter

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

" Run specific language and compile it  
augroup run 
  autocmd filetype c nnoremap <silent><F5> :w <CR>k :split term://gcc % && ./a.out <CR> i 
  autocmd filetype cpp nnoremap <silent><F5> :w <CR>k :split term://g++ % && ./a.out <CR> i 
  autocmd filetype python nnoremap <silent><F5> :w <CR>k :split term://python % <CR> i  
  autocmd filetype php nnoremap <silent><F5> :w <CR>k :split term://php % <CR> i  
  autocmd filetype go nnoremap <silent><F5> :w <CR>k :split term://go run % <CR> i  
  autocmd filetype markdown nnoremap <silent><F5> :w <CR>k :!google-chrome %<CR>
augroup end 
