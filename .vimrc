"
" MAIN CUSTOMIZATION FILE
"

set nocompatible " don't need to be compatible with vi anymore

" moves the .vimrc and other files into the roaming user profile
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
"set runtimepath=~/.vim,$VIMRUNTIME,~/.vim/after

"pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Enable loading filetype and indentation plugins
filetype plugin on 
filetype indent on

set modelines=0 " prevents some security exploits having to do with modelines in files

"colorscheme ir_black
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme mustang
colorscheme lucius

" Turn syntax highlighting on
syntax on

scriptencoding utf-8

" change the mapleader from \ to ,
let mapleader=","


" Don't beep, just flash
set visualbell
set vb t_vb=

if has("gui_running")
        if has("gui_gtk2")
            set guifont=Courier\ New\ 11
        elseif has("x11")
            set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
        else
            set guifont=Consolas
        endif
    endif 

" If the directory ~/.vim_backup exists, keep a backup file there.  If not, 
" don't keep any backups at all.
let BACKUPDIR=expand("H:/vim_backup")
if isdirectory(BACKUPDIR)
  set backup
  set backupdir=H:/vim_backup
else
  set nobackup	" Don't keep a backup file
endif

" Add <>'s to the % key
set matchpairs+=<:>

"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Change to the current directory
set autochdir

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

set ignorecase

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set hlsearch
"set nohlsearch
" maps ,space to clear out search
nnoremap <leader><space> :noh<cr>  

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" show relative numbers in the numline in 7.3
if version >= 703
	set relativenumber
else 
	set number
endif

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

set smartcase

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" MSWin stuff
"use ctrl-Q for visual mode and ctrl-v for paste
"behave mswin
" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" /mswin stuff

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" MAPPINGS
"

" turn off arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" maps ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" this makes the cursor use window lines, not text lines
nnoremap j gj
nnoremap k gk

"php commenting 
vmap <leader>c :s!^!//!<CR>
vmap <leader>u :s!^//!!<CR>

" ,ft mapped to a “fold tag” function:
noremap <leader>ft Vatzf

" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

" Set up cscope options
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif

let php_sql_query=1 " to highlight SQL syntax in strings
let php_htmlInStrings=1 "to highlight HTML in string
let php_noShortTags = 1 "to disable short tags
let php_folding = 1 "to enable folding for classes and functions

"
" NERDTree configuration
"
" Increase window size to 35 columns
let NERDTreeWinSize=35


"
" PIV
"
let g:DisableAutoPHPFolding = 0

" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!C:\wamp\bin\php\php5.3.0\php.exe -l %<CR>
:autocmd FileType php noremap <C-M> :!C:\wamp\bin\php\php5.3.0\php.exe %<CR>
set makeprg=C:\wamp\bin\php\php5.3.0\php.exe\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious
:nmap <C-tab> :tabnext<cr>

" maximize window size and make all split windows the same size
nnoremap <C-F12> :simalt ~x<CR><C-W>
" minimize the window size
nnoremap <S-F12> :simalt ~r<CR>
" minimize the window size
nnoremap <S-C-F12> :simalt ~n<CR>

"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" easy indentation in visual mode
" This keeps the visual selection active after indenting.
" Usually the visual selection is lost after you indent it
vmap > >gv
vmap < <gv

"au FileType php,htm,html,xml so c:/program files/vim/vimfiles/plugin/html_autoclosetag.vim

nmap <silent> <F4>
	\ :!ctags.exe -f ./tags
	\ --langmap="php:+.inc"
	\ -h ".php.inc" -R --totals=yes
	\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>
set tags=./tags,tags

	nmap <silent> <F8> :TlistToggle<CR>

" easily edit and reload _vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" closetag see http://mirnazim.org/writings/vim-plugins-i-use/
" Only load closetag on files that might use it
autocmd FileType html,htm,xhtml,xml,py,php let b:closetag_html_style=1
autocmd FileType html,htm,xhtml,xml,py,php source ~/.vim/bundle/closetag/plugin/closetag.vim

