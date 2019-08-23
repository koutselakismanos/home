if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Apperance
Plug 'flazz/vim-colorschemes'

"Windows and Features
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'markonm/traces.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

"Motions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'

"Language specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'

"AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
"---------------------------------------------------------------------------------

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scrollbar
set guioptions-=e "remove tabs

set guifont=FuraCode\ Nerd\ Font\ 11
set termguicolors
set background=dark
colorscheme gruvbox

" Colorize line numbers in insert and visual modes
"---------------------------------------------------------------------------------
set encoding=UTF-8
" set backupdir=~/.vim/tmp " for the backup files
" set directory=~/.vim/tmp " for the swap files
set directory=~/.vim/swapfiles//

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

set completeopt-=preview

"display line relative to position
set relativenumber

" Scroll padding
set scrolloff=5
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

""convert tab to spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set splitright

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
set listchars=trail:·
nnoremap <F3> :set list!<CR>

set clipboard+=unnamedplus

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


map <F4> :call NerdTreeToggler()<CR>
map <S-F4> :NERDTreeToggle<CR>

nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

let g:sneak#label = 1

" FZF----------
nmap <C-p> :GFiles<CR>
nmap <C-F> :Ag<Space>

nmap <leader>b :Buffers<CR>

nmap <leader>H :History<CR>
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>

nmap <leader>C :Commands<Cr>

nmap <leader>M :Maps<CR>

nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

" -------------

nnoremap <leader>; A;<ESC>

imap jk <ESC>
imap JK <ESC>

nmap <leader>c <Plug>CommentaryLine

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

" Better folding
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

"Nerdtree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
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

" Remove trailing whitespace

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

function! ChangeDirectoryCustom(dir_path)
    let before_dir= getcwd()
    execute 'cd '.fnameescape(a:dir_path)
    let after_dir= getcwd()
    if before_dir !=# after_dir
        " place custom current directory changed event handler code here
        " Make vim-fugitive use the new current directory repository if there is no current file
        let current_file_name= expand('%')
        if current_file_name == ''
            if exists('b:git_dir')
                unlet b:git_dir
            endif
            call fugitive#detect(getcwd())
        endif
    endif
endfunction
