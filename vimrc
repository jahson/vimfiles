" Bye-bye, vi! Must be first, because it changes other options.
set nocompatible

" Pathogen to work {{{
call pathogen#infect()
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
syntax on
" Avoid some "hit-enter" messages
set shortmess=aoO
" Set numer of colors for terminal
if !has('gui_running')
  set t_Co=256
endif
" Colorscheme
set background=dark
colorscheme solarized
" Highlight textwidth + 1 column
set colorcolumn=+1
" Highlight current line
set cursorline
" Show some useful whitespaces (such as tabs and trailing spaces)
set list
set listchars=tab:»\ ,trail:·,nbsp:%,extends:>,precedes:< ",eol:¬
" Disable scrollof to get H, M and L properly working
set scrolloff=0
" The minimal number of columns to scroll horizontally.
set sidescroll=5
" The minimal number of screen columns to keep to the left and to the
" right of the cursor if 'nowrap' is set.
set sidescrolloff=5
" Use menu to show command-line completion (in 'full' case)
set wildmenu
" Command line completion: complete longest common string, then list alternatives.
set wildmode=list:longest,full
" ignore some files
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.DS_Store?
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
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
" Automatically read changed file
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
" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

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
" Yank/paste to/from clipboard
set clipboard+=unnamed
" Backspace will delete indent and newline
set backspace=indent,eol,start
" Jump to matching bracket for 3/10th of a second (works with showmatch)
set showmatch
set matchtime=3
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

" <Leader>2 switches indent to 2 spaces
nmap <Leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
" <Leader>4 switches indent to 4 spaces
nmap <Leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>

" Easy jump between bracket pairs by pressing TAB
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + h moves cursor to window left of current one
map <C-H> <C-W>h
" Ctrl + j moves cursor to window below of current one
map <C-J> <C-W>j
" Ctrl + k moves cursor to window above of current one
map <C-K> <C-W>k
" Ctrl + l moves cursor to window right of current one
map <C-L> <C-W>l

" <Leader>v vertically splits current window in two
noremap <Leader>v :vsplit<CR>
" <Leader>h horizontally splits current window in two
noremap <Leader>h :split<CR>
" <Leader>c closes current window
noremap <Leader>c :close<CR>

" <Leader>. goes to next buffer
nmap <silent> <Leader>. :bn<CR>
" <Leader>m goes to previous buffer
nmap <silent> <Leader>m :bp<CR>
" <Leader><Leader> switches between two last buffers
nnoremap <Leader><Leader> <C-^>

" Don't touch arrow keys!
inoremap <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Right>  <NOP>
noremap  <Left>   <NOP>

" Ctrl + h moves cursor left in insert mode
imap <C-H> <C-O>h
" Ctrl + h moves cursor down in insert mode
imap <C-J> <C-O>j
" Ctrl + h moves cursor up in insert mode
imap <C-K> <C-O>k
" Ctrl + h moves cursor right in insert mode
imap <C-L> <C-O>l

" Clear trailing whitespaces
nmap <silent> <Leader><Space> :call ClearTrailingWhitespace()<CR>
" Clear ^M from dos fileformat and replace with \r
nmap <silent> <Leader>df :%s/\r\(\n\)/\1/ge<CR>

" Try to live without Esc
imap jj <Esc>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref nnoremap <buffer> q <C-W>c
autocmd FileType * if &readonly | nnoremap <buffer> q <C-W>c | endif

" Stop search highlighting
map <silent> <Esc><Esc> :nohlsearch<CR>
" Close current buffer
nmap <Leader>b :bd<CR>
" Exit saving changes if changes were made
nmap <Leader>w :xa!<CR>
" Save changes (forced for readonly files)
map <Leader>s :w!<CR>
" Exit without saving
map <Leader>q :qa!<CR>
" Fast editing of .vimrc
map <Leader>ev :edit! ~/.vimrc<CR>
" Use CTRL-F for omni completion
imap <C-F> 
" Display all lines with word under cursor and ask which one to jump to
nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" Open filename under cursor in a new window (use current file's working directory)
nmap gf :new %:p:h/<cfile><CR>
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Visual mode replace without overwriting the register
vmap r "_dP

" Toggle paste helper on <F5>
set pastetoggle=<F5>

" <F2> to toggle line numbers
nmap <silent> <F2> :set number!<CR>
nmap <silent> <F2> :call GoOverNumberingModes()<CR>

" Append modeline to the end of file
nmap <Leader>ml :call AppendModeline()<CR>

" Insert the path of the currently edited file into a command line
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"}}}

" Functions: {{{

function! s:isLineEmpty()
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction

function! GoOverNumberingModes()
  if &number
    set nonumber
    set relativenumber
  elseif &relativenumber
    set norelativenumber
  else
    set number
  endif
endfunction

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' expandtab: '
  $put = ''
  $put = substitute(&commentstring, '%s', append, '')
  call setpos('.', save_cursor)
endfunction

function! ClearTrailingWhitespace()
  exec ':%s/\s\+$//gec'
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
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
endif
"}}}

" TagList. {{{
" Set location of ctags
let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
" Show tags only for current buffer
let Tlist_Show_One_File = 1
" Automatically highlight the curent tag
let Tlist_Auto_Highlight_Tag = 1
" Do not show fold column
let Tlist_Enable_Fold_Column = 0
" width of window in columns
let Tlist_WinWidth = 45
" Configure language settings
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let tlist_javascript_settings = 'javascript;f:function;m:method;p:property;c:class;v:global'
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
" <TAB> completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Plugin key-mappings.
imap <C-e> <Plug>(neocomplcache_snippets_expand)
smap <C-e> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
"}}}
" CScope. {{{
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"}}}
" TagList. {{{
" <F4> to toggle TagList window
nmap <silent> <F4> :TlistToggle<CR>
"}}}
" Ack. {{{
map <Leader>a :execute "Ack " . expand("<cword>") <Bar> cw<CR>
"}}}

"}}}

" Commands: {{{

" Write file using sudo
command W exec 'w !sudo tee % > /dev/null' | e!

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
