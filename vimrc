" Bye-bye, vi! Must be first, because it changes other options.
set nocompatible

" Pathogen to work {{{

" Disable filetype first
filetype off
" Then load bundles help and code
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

"}}}

" Use ',' as mapleader
let mapleader = ","
let g:mapleader = ","

" Enable filetype detection, plugins and indenting
filetype plugin indent on

" Encoding, do not move below
set fileencodings=utf-8,cp1251,koi8-r,cp866
set encoding=utf-8

" Save on losing focus
autocmd FocusLost * :wa

" Interface: {{{

" Enable syntax highlighting
syntax enable
" Avoid some "hit-enter" messages
set shortmess=aoO
" Set numer of colors for terminal
if !has('gui_running')
  set t_Co=256
endif
" Colorscheme
colorscheme solarized
" Highlight textwidth + 1 column
set colorcolumn=+1
" Highlight current line
set cursorline
" Show some useful whitespaces (such as tabs and trailing spaces)
set list
set listchars=tab:»\ ,trail:·,nbsp:%,extends:>,precedes:<
"set listchars+=eol:¬
" Disable scrollof to get H, M and L properly working
set scrolloff=0
" The minimal number of columns to scroll horizontally.
set sidescroll=5
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=5
" Use menu to show command-line completion (in 'full' case)
set wildmenu
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common string
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
set statusline=[%{getcwd()}]\ %<%.99f\ %h%w%m%r%y\[\%{&encoding}]\%{fugitive#statusline()}\ \Line:\ %l/%L:%c\ %P\ Byte:\ %b
" Always show tabline
set showtabline=2
" Hide the mouse when typing text
set mousehide
" No bells
set noerrorbells
set novisualbell
set t_vb=
" Remember up to 400 'colon' commmands and search patterns
set history=400
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
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute("normal! g'\"") | endif
" Set to auto read when a file is changed from the outside
set autoread
" Write contents of the file, if it has been modified, on buffer exit
set autowrite

"}}}

" Searching: {{{

" Enable incremental search
set incsearch
" Highlight results of a search
set hlsearch
" Be case sensitive only when search contains uppercase characters
set ignorecase smartcase
" Use perl regex style
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

"}}}

" Editing: {{{

" Set the ':substitute' flag 'g' to be default on
set gdefault
" Set maximum text width (for wrapping)
set textwidth=80
" Do not wrap text
set nowrap
" Smart tab key behaviour
set smarttab
" Usee indent of 4 spaces by default
set tabstop=4
set shiftwidth=4
set expandtab
" Round indent to a multiple of shiftwidth
set shiftround
" Smart indent
set autoindent smartindent
" Enable modeline (nocompatible should already enable this,
" but sometimes it is disabled)
set modeline
" Yank and paste the selection without prepending "* to commands
set clipboard+=unnamed
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
set directory=~/.vim/tmp
" Backups
set backup
set backupdir=~/.vim/backup
" backupskip helps with crontab -e problems
set backupskip=/tmp/*,/private/tmp/*
" Persistent undo
if has( "persistent_undo" )
  set undodir=~/.vim/undo
  set undofile
endif
" Insert mode completion options
set completeopt=preview
" Configure complete options to complete
set complete=
" from current buffer
set complete+=.
" from other opened bufers
set complete+=b
" from tags
set complete+=t
" from dictionary
set complete+=k
" from included files
set complete+=i
" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha
" Don't complete comments on o and return
autocmd FileType * setlocal formatoptions-=ro

"}}}

" Mappings: {{{

" Switch between indent values
nmap <Leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
nmap <Leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>

" Easy jump between bracket pairs
nnoremap <Tab> %
vnoremap <Tab> %

" Move between windows quickly
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Windows split mappings
noremap <Leader>v :vsp<CR>
noremap <Leader>h :split<CR>

" Use arrow keys to navigate between buffers
nmap <Right> :bn<CR>
nmap <Left> :bp<CR>

" Clear trailing whitespaces
nmap <Leader>. :call ClearTrailingWhitespace()<CR>
" Clear ^M from dos fileformat and replace with \r
nmap <Leader>m :%s/\r\(\n\)/\1/g<CR>

" Try to live without ESC
imap jj <Esc>

" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref nnoremap <buffer> q <C-W>c
autocmd FileType * if &readonly | nnoremap <buffer> q <C-W>c | endif

" Stop search highlighting
map <Leader>/ :nohlsearch<CR>
" Close current buffer
nmap <Leader>b :bd<CR>
" Exit saving changes if changes were made
nmap <Leader>w :x<CR>
" Save changes (forced for readonly files)
map <Leader>s :w!<CR>
" Exit without saving (will not exit if hidden buffers with changes are present)
map <Leader>q :q!<CR>
" Fast editing of .vimrc
map <Leader>e :edit! ~/.vimrc<CR>
" Find file and edit
nmap <Leader>g :find<CR>
" Use CTRL-F for omni completion
imap <C-F> 
" Display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" Open filename under cursor in a new window (use current file's working directory)
nmap gf :new %:p:h/<cfile><CR>
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Toggle paste helper
set pastetoggle=<Leader>pt

" <F2> to toggle line numbers
nmap <silent> <F2> :set number!<CR>

" Append modeline to the end of file
nmap <Leader>ml :call AppendModeline()<CR>
"}}}

" Functions: {{{

function! s:isLineEmpty()
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.': '
  $put = ''
  $put = substitute(&commentstring, '%s', append, '')
  call setpos('.', save_cursor)
endfunction

function! ClearTrailingWhitespace()
  %s/\s\+$//
endfunction

"}}}

" Plugin settings: {{{

" NERDTree. {{{
" Increase window size to 35 columns
let NERDTreeWinSize=35
"}}}

" Neocomplcache. {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_max_list = 50
let g:neocomplcache_max_keyword_width = 70
"}}}

" VimFiler. {{{
let g:vimfiler_as_default_explorer = 1
"}}}

" DelimitMate. {{{
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
"}}}

" CScope. {{{
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
endif
"}}}

" Tag List. {{{
" Set location of ctags
let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
" Do not show fold column
let Tlist_Enable_Fold_Column = 0
" width of window in columns
let Tlist_WinWidth = 45
" Do not show variables for php
let tlist_php_settings = 'php;c:class;d:constant;f:function'
"}}}

" Syntastic. {{{
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_warnings=0
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}

"}}}

" Plugin mappings: {{{

" NERDTree. {{{
" <F3> to toggle NERDTree window
nmap <silent> <F3> :NERDTreeToggle<CR>
"}}}"
" Neocomplcache. {{{
" <CR> will close popup and save indent
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <BS> will close popup and delete last char
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" <TAB> completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"}}}
" CScope. {{{
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"}}}
" TagList. {{{
" <F4> to toggle taglist window
nmap <silent> <F4> :TlistToggle<CR>
"}}}

"}}}

" Commands: {{{

" Write file using sudo
cmap w!! silent write !sudo tee % > /dev/null

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"}}}

" Omni completion. {{{
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"}}}

" :h 'secure'
set secure

" vim: set ts=2 sw=2 fdm=marker expandtab:
