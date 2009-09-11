""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I don't need to be in VI compatible mode
set nocompatible

" Remember up to 400 'colon' commmands and search patterns
set history=400

" Enable filetype and indentation plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Save and restore folds
au BufWinLeave .* mkview
au BufWinEnter .* silent loadview

" Mapleader
let mapleader = ","
let g:mapleader = ","

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

" Windows options
set equalalways " created windows are eqal in size
set splitbelow splitright
noremap <leader>v :vsp<cr>
noremap <leader>h :split<cr>

" Don't complete comments
autocmd FileType * setlocal formatoptions-=cro

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Set font for editing
set guifont=Monaco:h10:cRUSSIAN

" Set numer of colors
set t_Co=256

colorscheme desert256

" Popup window color
highlight Pmenu ctermbg=238 gui=bold

" Matching paren highlight
highlight MatchParen ctermbg=darkgrey

autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

" Too long lines
highlight TooLongLine term=reverse ctermfg=Yellow ctermbg=Red
match TooLongLine /.\%>81v/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Scroll when cursor gets within 7 characters of top/bottom edge
set scrolloff=7

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

" Speed up macros by not redrawing, when using it
set lazyredraw

" Allow buffer change without saving
set hidden

" Allow backspacing over everything
set backspace=eol,start,indent

" Cursor keys wrap to
set whichwrap+=<,>,h,l

" Enable incremental search and ignore case, when searching
set incsearch
set ignorecase

" Changes the special characters that can be used in search patterns
set magic

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Highlight matching brackets
set showmatch

" Hide the mouse when typing text
set mousehide

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always show status line, even for one window
set laststatus=2
" Statusline format
set statusline=\ %<%F%h%m%r\ %b\ \ %{&encoding}\ \ \ Line:\ %l/%L:%c\ %P

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis and bracket expanding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap _( <esc>`>a)<esc>`<i(<esc>
vnoremap _[ <esc>`>a]<esc>`<i[<esc>
vnoremap _{ <esc>`>a}<esc>`<i{<esc>
vnoremap _< <esc>`>a><esc>`<i<<esc>
vnoremap _" <esc>`>a"<esc>`<i"<esc>
vnoremap _' <esc>`>a'<esc>`<i'<esc>

" auto complete for (, ", ', [ and {\}
inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
inoremap " "<C-R>=MyQuoteFunc( '"' )<cr><esc>i
inoremap ' '<C-R>=MyQuoteFunc( "'" )<cr><esc>i

function! MyQuoteFunc( quote )
    " Return nothing when there are even number of quotes and quote,
    " when there is odd number of quotes.
    if 0 == ( len ( split( getline( "." ), a:quote, 1) ) - 1 ) % 2
       return ''
    else
        return a:quote
    endif
endfunction

" jump out of parenthesis
inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a

function! BC_AddChar(schar)
	if exists("b:robstack")
		let b:robstack = b:robstack . a:schar
	else
		let b:robstack = a:schar
	endif
endfunction

function! BC_GetChar()
	let l:char = b:robstack[strlen(b:robstack)-1]
	let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
	return l:char
endfunction

" other
function! ClearTrailingWhitespace()
	%s/\s\+$//
endfunction
nmap <leader>. :call ClearTrailingWhitespace()<cr>

" do not touch esc
imap jj <esc>
" some imaps for php
imap hh =>
imap ff ->

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
set dir=~/.vim/vim_tmp

" Backup
set backup
set backupdir=~/.vim/vim_backup
" backupskip helps with crontab -e
set backupskip=/tmp/*,/private/tmp/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set cindent
set expandtab

" Highlight results of a search
set hlsearch

"Mapping to remove highlight
map <leader>h :noh<cr>

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Insert mode completion options
set completeopt=menu,longest,preview

" Go back to the position the cursor was on the last time this file was edited
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute( "normal g'\"" ) | endif

" Avoid loading MatchParen plugin
" let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"
" MAPPINGS
"
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
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

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

" NERDTree configuration
" Increase window size to 35 columns
let NERDTreeWinSize=35
" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>

" Project configuration
" Configure Project
let g:proj_window_width=35
" map <F5> to toggle Project window
nmap <silent> <F5> :Project<CR>

" VSCOMMAND
nmap <leader>ca <Plug>VCSAdd

" Run PHP in cli
autocmd filetype php nmap <leader>r :w!<CR>:!php %<CR>

" Write file using sudo
cmap w!! %!sudo tee > /dev/null %

autocmd BufEnter *.js,*.html,*.tpl set ts=4 sw=4 noexpandtab


" Generic highlight changes
highlight Comment cterm=none ctermfg=DarkGray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan
