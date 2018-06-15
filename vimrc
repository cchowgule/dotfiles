" My User VIMRC copied from MacVim

" Remove forced Vi compatability
set nocompatible

" Vim-Plug
" 1. Install
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" 2. Specify a directory for plugins and initiate
call plug#begin('~/.vim/bundle')
" 2.i. vim-plug itself for help files
Plug 'junegunn/vim-plug'
" 2.ii. NERDTree
Plug 'scrooloose/nerdtree'
" 2.iii. Solarized theme
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" 2.iv. Gotham theme
Plug 'whatyouhide/vim-gotham'
" 2.v. BufferGator
"Plug 'jeetsukumaran/vim-buffergator'
" 2.vi. DelimitMate
Plug 'Raimondi/delimitMate'
" 2.vii. YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" 2.viii UltiSnips
Plug 'SirVer/ultisnips'
" 2.ix Vim-Snippets
Plug 'honza/vim-snippets'
" 2.x LateX-Box
Plug 'LateX-Box-Team/LateX-Box'
" 2.xi Command-t
Plug 'wincent/command-t'
" 2.xii CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" 2.xiii QML Syntax for VIM
Plug 'peterhoeg/vim-qml'
" 2.xiv VimWiki
Plug 'vimwiki/vimwiki'
" 2.xv Calendar.vim
Plug 'itchyny/calendar.vim'
" 2.xvi Bad Wolf theme
Plug 'sjl/badwolf'
" 2.xvii Fugitive
Plug 'tpope/vim-fugitive'
" 2.xviii vim-git
Plug 'tpope/vim-git'
call plug#end()

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimise for fast terminal connections
set ttyfast

" No empty newline at end of file
set noeol

" Centralise backups, swaps and undo
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable syntax highlighting
syntax enable

" Cursor related
set cursorline
set ruler

" Enable line numbers, set them to relative
set number
set relativenumber

" Search related
set hlsearch
set ignorecase
set incsearch

" Scroll early
set scrolloff=5

" Colours and themes
" 1. Solarize me
"set background=dark
"colorscheme solarized

" 2. Gotham
"colorscheme gotham256

" 3. Bad Wolf
colorscheme badwolf

" NERDTree
" 1. On startup
autocmd vimenter * NERDTree ~/
autocmd vimenter * wincmd l
autocmd vimenter * NERDTreeToggle
" 2. Quits buffer if ... something
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 3. Map toggle NERDTree to <leader>n in normal
nmap <leader>n :NERDTreeToggle<CR>
" 4. Set Quit on OPen
let NERDTreeQuitOnOpen = 1
" 5. Open bookmarks table on startup
let NERDTreeShowBookmarks = 1

" Keep status bar
set laststatus=2

"Set WD
cd /media/interchange/WD

" Scratch - REPLACED BY VIMWIKI
" 1. Launch on startup
" autocmd vimenter * :e /media/interchange/WD/scratch.txt
" 2. Map open scratch to <leader>s in normal
" nmap <leader>s :e /media/interchange/WD/scratch.txt<CR>

" Filetype autodetect
filetype on

" DelimitMate
let delimitMate_expand_cr=1

" UltiSnips
" 1. Set directories
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
" 2. Set expand trigger
let g:UltiSnipsExpandTrigger="<C-j>"
" 3. Set jump forward trigger
let g:UltiSnipsJumpForwardTrigger="<C-j>"
" 4. Set jump backward trigger
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" BufferGator
" 1. Autoupdate BufferGator
let g:buffergator_autoupdate=1
" 2. No autoexpand on split
let g:buffergator_autoexpand_on_split=0

" Don't use scratch preview for autocomplete
set completeopt-=preview

" Set initial window size
if has("gui_running")
	set lines=999 columns=104
else
	if exists("+lines")
		set lines=50
	endif
	if exists("+columns")
		set columns=100
	endif
endif

" Set python interpreter for YouCompleteMe
" let g:ycm_server_python_interpreter='/usr/bin/python2'

" Eclim
" 1. Completion method
" let g:EclimCompletionMethod='omnifunc'
" 2. Key mappings
" map <F6> :JavaImportOrganize<CR>

" Set font size
set guifont=Noto\ Mono\ Regular\ 11

" Allow local vimrc and secure
set exrc
set secure

" Line breaking and wrapping
set linebreak
nmap j gj
nmap k gk

" VimWiki options
" 1. Main wiki definition
let main_wiki = {}
let main_wiki.path = '/media/interchange/Documents/wikis/main_wiki'
let main_wiki.path_html = '/media/interchange/Documents/wikis/main_wiki/html'
let main_wiki.auto_toc = 1

" 2. Global options
let g:vimwiki_list = [main_wiki]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_hl_headers = 1

" Calendar.vim 
" 1. global options
let g:calendar_clock_12hour = 1
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = '~/.vim/cache/calendar.vim/'

" 2 Google sync
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Spell Check
set spelllang=en_gb
set spellfile=~/.vim/spell/engb.utf-8.add

" Remove toolbar
set guioptions-=T

" Command T Options
nmap <silent> <Leader>l <Plug>(CommandTLine)

" C specific
" Force .h files to be read as C with doxygen subtype
"augroup project
"	autocmd!
"	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

" Include include folders in path for gf
"let &path.="src/include,/usr/include/AL,"

" Change "." to "/" for gf and related
"set includeexpr=substitute(v:fname,'\\.','/','g')
