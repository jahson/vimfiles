""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I don't need to be in VI compatible mode
if !exists('s:vimrc_loaded')
	" do not set again on reloading or there will be side effects
	set nocompatible
endif

" Enable filetype and indentation plugins
filetype on
filetype plugin on
filetype indent on

" Use ',' as mapleader
let mapleader = ","
let g:mapleader = ","

" Set some options for *.tpl files
autocmd BufEnter *.tpl set ts=4 sw=4 noexpandtab
" Reload .vimrc automatically
autocmd! bufwritepost .vimrc source ~/.vimrc

" Interface: {{{

" Enable syntax highlighting
syntax on
" Set numer of colors for terminal
if !has('gui_running')
	set t_Co=256
endif
" Colorscheme
colorscheme xoria256
" Highlight too long lines
highlight TooLongLine  term=reverse ctermfg=yellow ctermbg=darkred
match TooLongLine '/.\%>81v.\+/'
" Show some useful whitespaces (such as tabs and trailing spaces)
set list
set listchars=tab:»\ ,trail:·,nbsp:%,extends:>,precedes:<
" Disable scrollof to get H, M and L properly working
set scrolloff=0
" The minimal number of columns to scroll horizontally.
set sidescroll=5
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=5
" Use menu to show command-line completion (in 'full' case)
set nowildmenu
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full
" Show line, column number, and relative position within a file
set ruler
" Show commands (or size of selection in Visual mode)
set showcmd
" Height of commandline
set cmdheight=2
" Show line numbers and set width of number zone to 8 symbols
set numberwidth=8
set number
" Do not redraw screen during macros run
set lazyredraw
" Improve redrawing for fast terminal connection
set ttyfast
" Allow specified keys to move to the previous/next line
set whichwrap+=<,>,[,],h,l,b,s,~
" Always show status line, even for one window
set laststatus=2
" Statusline format
set statusline=\ %<%F%h%m%r%y\ \%{&encoding}\ \Line:\ %l/%L:%c\ %P\ Byte:\ %b
" Hide the mouse when typing text
set mousehide
" Set terminal title
set title
set titlelen=80
set titlestring=%{expand('%:p:.')}%(\ %m%r%w%)\ %<\(%{SnipMid(getcwd(),80-len(expand('%:p:.')),'...')}\)\ -\ Vim
" No bells
set noerrorbells
set novisualbell
set t_vb=
" Remember up to 400 'colon' commmands and search patterns
set history=400
" Enable spell-checking
set spelllang=en_us
" Max height of popup menu
set pumheight=20
" Always number of lines changed
set report=0
" Keep cursor on same column when moving
set nostartofline
" Windows options
set equalalways
" when split put new windows right and below
set splitbelow splitright
" Go back to the position the cursor was on the last time this file was edited
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute( "normal g'\"" ) | endif
" Save and restore folds
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
" Set to auto read when a file is changed from the outside
set autoread
" Write contents of the file, if it has been modified, on buffer exit
set autowrite
" Remember things between sessions
" '20  - remember marks for 20 previous files
" \"100 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"100,:20,%,n~/.viminfo
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
" Set the ':substitute' flag 'g' to be default on
set gdefault
" }}}

" Searching: {{{

" Enable incremental search
set incsearch
" Highlight results of a search
set hlsearch
" Be case sensitive only when search contains uppercase
set ignorecase smartcase
"}}}

" Editing: {{{

" Set maximum text width (for wrapping)
set textwidth=80
" Do not wrap text
set nowrap
" Smart tab key behaviour
set smarttab
" Size of autoindent step in spaces
set shiftwidth=4
" Round indent to a multiple of shiftwidth
set shiftround
" Size of tab in spaces
set tabstop=4
" Smart indent
set autoindent smartindent
" Enable automatic C program indenting
set cindent
" Use spaces instead of tabs
set expandtab
" Enable modeline (nocompatible should already enable this,
" but sometimes it is disabled)
set modeline
" Use clipboard register
set clipboard& clipboard+=unnamed
" Backspace will delete indent and newline
set backspace=indent,eol,start
" Jump to matching bracket for 3/10th of a second (works with showmatch)
set showmatch
set matchtime=3
" Add < and > to characters that form pairs
set matchpairs+=<:>
" Allow buffer changing (:bp etc.) without saving
set hidden
" Lower mappings timeout
set timeoutlen=500
" Save swap file after every 3000 milliseconds
set updatetime=3000
" Save swap file after every 50 characters
set updatecount=50
" Set directory for swap files
set directory=~/.vim_tmp
" Backups
set backup
set backupdir=~/.vim_backup
" backupskip helps with crontab -e problems
set backupskip=/tmp/*,/private/tmp/*
" Insert mode completion options
set completeopt=menu,longest,preview
" Configure complete options
set complete=""
" Complete
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
" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha
" Don't complete comments on o and return
autocmd FileType * setlocal formatoptions-=ro
" Encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8
"}}}

" Keybindings: {{{

" Move between windows quickly
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" Windows split mappings
noremap <leader>v :vsp<cr>
noremap <leader>h :split<cr>

" Use arrow keys to navigate between buffers
map <right> :bn<cr>
map <left> :bp<cr>

" Clear trailing whitespaces
nmap <leader>. :call ClearTrailingWhitespace()<cr>

" Try to not touch esc
imap jj <esc>

" use enter and shift+enter for inserting newlines without going to insert mode
map <s-enter> O<esc>
map <enter> o<esc>
" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref nnoremap <buffer> q <C-w>c
autocmd FileType * if &readonly |  nnoremap <buffer> q <C-w>c | endif

"Mapping to remove highlight
map <leader>n :noh<cr>
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

" <F2> to toggle paste helper - get rid of problems with imaps etc.
set pastetoggle=<F2>

" <F3> to toggle line numbers
nmap <silent> <F3> :set number!<cr>

" Error list navigation
nmap <leader>j :cn<cr>
nmap <leader>k :cp<cr>

nmap <Leader>ml :call AppendModeline()<CR>
" }}}

" Functions: {{{
function! SnipMid(str, len, mask)
  if a:len >= len(a:str)
    return a:str
  elseif a:len <= len(a:mask)
    return a:mask
  endif

  let len_head = (a:len - len(a:mask)) / 2
  let len_tail = a:len - len(a:mask) - len_head

  return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
	let save_cursor = getpos( '.' )
	let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.': '
	$put = ''
	$put = substitute( &commentstring, '%s', append, '' )
	call setpos( '.', save_cursor )
endfunction

function! ClearTrailingWhitespace()
	%s/\s\+$//
endfunction
"}}}

" Plugins: {{{

" NERDTree. {{{
" Increase window size to 35 columns
let NERDTreeWinSize=35
" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>
" }}}

" Project. {{{
let g:proj_window_width=35
" map <F5> to toggle Project window
nmap <silent> <F5> :Project<CR>
" }}}

" Neocomplcache. {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smartcase = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_dictionary_filetype_lists = {
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
	\ 'css' : 'csscomplete#CompleteCSS',
	\ 'php' : 'phpcomplete#CompletePHP',
	\ 'python' : 'pythoncomplete#Complete',
	\ 'ruby' : 'rubycomplete#Complete',
    \ 'javascript' : 'javascriptcomplete#CompleteJS',
	\ }
" Keybindings
imap <silent>L     <Plug>(neocomplcache_snippets_expand)
smap <silent>L     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"}}}

" VimFiler. {{{
let g:vimfiler_as_default_explorer = 1
"}}}
"}}}

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

" Write file using sudo
cmap w!! %!sudo tee > /dev/null %

" Commands: {{{

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif
" }}}

" Omni completion. {{{
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"}}}

if !exists('s:vimrc_loaded')
	let s:vimrc_loaded = 1
else
	" Nothing
endif

" :h 'secure'
set secure

" vim: set ts=4 sw=4 fdm=marker noexpandtab:
