""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I don't need to be in VI compatible mode
set nocompatible

" Remember up to 400 'colon' commmands and search patterns
set history=400

" Set terminal title
set title

" Enable filetype and indentation plugins
filetype on
filetype plugin on
filetype indent on

set autoread " Set to auto read when a file is changed from the outside
set autowrite " Write contents of the file, if it has been modified, on buffer exit

" Save and restore folds
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Mapleader
let mapleader = ","
let g:mapleader = ","

" Show some whitespaces
set list
set listchars=tab:»\ ,trail:·,nbsp:%

" Complete options
set complete=""
" from current buffer
set complete+=.
" from dictionary
set complete+=k
" from other opened bufers
set complete+=b
" from tags
set complete+=t
" from included files
set complete+=i

" Windows options
set equalalways " created windows are eqal in size
set splitbelow splitright " when split put new windows right and below
" Windows split mappings
noremap <leader>v :vsp<cr>
noremap <leader>h :split<cr>

autocmd FileType * setlocal formatoptions-=ro " Don't complete comments on o and return

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Set numer of colors
set t_Co=256

colorscheme xoria256

" Highlight too long lines
highlight TooLongLine  term=reverse ctermfg=yellow ctermbg=darkred
match TooLongLine '/.\%>81v.\+/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=0 " Disable scrollof to get H, M and L properly working

" The minimal number of columns to scroll horizontally.
set sidescroll=5
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=5

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Show line, column number, and relative position within a file
set ruler

" Show (partial) commands (or size of selection in Visual mode)
set showcmd

" Height of commandbar
set cmdheight=2

" Show line numbers and set width of number zone to 8 symbols
set numberwidth=8
set number

set lazyredraw " Do not redraw screen during macros run
set ttyfast    " Improve redrawing for fast terminal connection
set hidden " Allow buffer change without saving
set backspace=eol,start,indent " Allow backspacing over everything
set whichwrap+=<,>,h,l " Cursor keys wrap to
set incsearch " Enable incremental search
set ignorecase smartcase " Be case sensitive only when search contains uppercase
set gdefault " Set the ':substitute' flag 'g' to be default on

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Jump to matching bracket for 3/10th of a second (works with showmatch)
set showmatch
set matchtime=3

" Set maximum text width (for wrapping)
set textwidth=80

" Hide the mouse when typing text
set mousehide

set timeoutlen=500 " Lower mappings timeout
set report=0       " Always report changes

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set laststatus=2 " Always show status line, even for one window
" Statusline format
set statusline=\ %<%F%h%m%r%y\ \%{&encoding}\ \Line:\ %l/%L:%c\ %P\ Byte:\ %b

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move between windows quickly
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Use arrow keys to navigate between buffers
map <right> :bn<cr>
map <left> :bp<cr>

" other
function! ClearTrailingWhitespace()
	%s/\s\+$//
endfunction
nmap <leader>. :call ClearTrailingWhitespace()<cr>

" Try to not touch esc
imap jj <esc>

" use enter and shift+enter for inserting newlines without going to insert mode
map <s-enter> O<esc>
map <enter> o<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remember things between sessions
" '20  - remember marks for 20 previous files
" \"100 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"100,:20,%,n~/.viminfo

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" paste helper - to get rid of problems with imaps etc.
set pastetoggle=<F2>

" Encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8

" Write swap file to disk after every 50 characters
set updatecount=50

" Set directory for swap files
set dir=~/.vim_tmp

" Backup
set backup
set backupdir=~/.vim_backup
" backupskip helps with crontab -e
set backupskip=/tmp/*,/private/tmp/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent smartindent " Smart indent
set cindent
set expandtab

" Highlight results of a search
set hlsearch

"Mapping to remove highlight
map <leader>n :noh<cr>

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Insert mode completion options
set completeopt=menu,longest,preview

" Go back to the position the cursor was on the last time this file was edited
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute( "normal g'\"" ) | endif

"
" MAPPINGS
"

" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref nnoremap <buffer> q <C-w>c
autocmd FileType * if &readonly |  nnoremap <buffer> q <C-w>c | endif
" Close current buffer
nmap <leader>b :bd<CR>
" Exit saving changes
nmap <leader>w :x<CR>
" Save changes
map <leader>s :w!<CR>
" Exit without saving
map <leader>q :q!<CR>
" Fast editing of .vimrc
map <leader>e :edit! ~/.vimrc<CR>
" Reload .vimrc
autocmd! bufwritepost vimrc source ~/.vimrc
" Find file and edit
nmap <leader>g :find<CR>
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map <leader>f display all lines with keyword under cursor and ask which one to
" jump to
nmap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" open filename under cursor in a new window (use current file's working directory)
nmap gf :new %:p:h/<cfile><CR>
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" <F3> to toggle line numbers
nmap <silent> <F3> :set number!<cr>

" Error list navigation
nmap <leader>j :cn<cr>
nmap <leader>k :cp<cr>

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
	let save_cursor = getpos( '.' )
	let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.': '
	$put = ''
	$put = substitute( &commentstring, '%s', append, '' )
	call setpos( '.', save_cursor )
endfunction
nmap <Leader>ml :call AppendModeline()<CR>

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" Setup cscope options
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

" NERDTree configuration. {{{
" Increase window size to 35 columns
let NERDTreeWinSize=35
" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>
" }}}

" Project configuration. {{{
let g:proj_window_width=35
" map <F5> to toggle Project window
nmap <silent> <F5> :Project<CR>
" }}}

" Neocomplcache configuration. {{{
let g:neocomplcache_enableatstartup = 1
let g:neocomplcache_smartcase = 1
let g:neocomplcache_enablecamelcasecompletion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_enableunderbarcompletion = 1
let g:neocomplcache_dictionaryfiletypelists = {
	\ 'default'    : '',
	\ 'erlang'     : $VIMRUNTIME . '/dictionaries/erlang.dict',
	\ 'objc'       : $VIMRUNTIME . '/dictionaries/objc.dict',
	\ 'javascript' : $VIMRUNTIME . '/dictionaries/javascript.dict',
	\ 'ruby'       : $VIMRUNTIME . '/dictionaries/ruby.dict',
	\ 'perl'       : $VIMRUNTIME . '/dictionaries/perl.dict',
	\ 'php'        : $VIMRUNTIME . '/dictionaries/php.dict',
	\ 'scheme'     : $VIMRUNTIME . '/dictionaries/gauche.dict',
	\ 'int-erl'    : $VIMRUNTIME . '/dictionaries/erlang.dict',
	\ 'int-irb'    : $VIMRUNTIME . '/dictionaries/ruby.dict',
	\ 'int-perlsh' : $VIMRUNTIME . '/dictionaries/perl.dict'
	\ }
let g:neocomplcache_omni_function_list = {
	\ 'css'    : 'csscomplete#CompleteCSS',
	\ 'php'    : 'phpcomplete#CompletePHP',
	\ 'python' : 'pythoncomplete#Complete',
	\ 'ruby'   : 'rubycomplete#Complete',
	\ }
" }}}
" Neocomplcache key-mappings."{{{
imap <silent>L     <Plug>(neocomplcache_snippets_expand)
smap <silent>L     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"}}}

" VimFiler configuration. {{{
let g:vimfiler_as_default_explorer = 1
"}}}

" Write file using sudo
cmap w!! %!sudo tee > /dev/null %

autocmd BufEnter *.js,*.html,*.tpl set ts=4 sw=4 noexpandtab

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" Enable omni completion. {{{
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"}}}

" vim: set ts=4 sw=4 fdm=marker noexpandtab:
