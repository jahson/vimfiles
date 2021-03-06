" Try
" <tab> / <s-tab> | Circular windows navigation
" nnoremap <tab>   <c-w>w
" nnoremap <S-tab> <c-w>W
"

scriptencoding utf-8
set encoding=utf-8

let g:investigate_use_dash = 1
" Bye-bye, vi! Must be first, because it changes other options.
set nocompatible

if filereadable(expand("~/.vimrc.plugs"))
  source ~/.vimrc.plugs
endif

if filereadable(expand("~/.vimrc.experimental"))
  source ~/.vimrc.experimental
endif

" Use space as <leader>
let mapleader = "\<space>"
" Use comma as <localleader>"
let maplocalleader = ","

" Encoding, do not move below
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Save on losing focus
autocmd FocusLost * :wa

" Interface: {{{

" Enable syntax highlighting
syntax on
" highlight and show placeholders for errant whitespace
set list
set listchars=""
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶,nbsp:█
" Avoid some "hit-enter" messages
set shortmess=filmnrxoOtT
" Colorscheme and backround
set background=dark
" set background=light
colorscheme iceberg
" Disable folding
set nofoldenable
" Highlight textwidth + 1 column
set colorcolumn=+1
" Highlight current line
set cursorline
" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
" ignore some files
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.DS_Store?
" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
" Height of commandline
set cmdheight=2
" Show no line numbers and set width of number zone to 6 symbols
set numberwidth=6
set nonumber
" Do not redraw screen during macros run
set lazyredraw
" Improve redrawing for fast terminal connection
set ttyfast
" Allow specified keys to move to the previous/next line
set whichwrap+=<,>,[,],h,l,b,s,~
if has('statusline')
  set laststatus=2
  set statusline=[%{getcwd()}]\ %<%.99f\ %h%w%m%r%y\[\%{&encoding}]\%{fugitive#statusline()}\ \Line:\ %l/%L:%c\ %P\ Byte:\ %b
endif
" Always show tabline
set showtabline=2
" Hide the mouse when typing text
set mousehide
" No bells
set noerrorbells
set novisualbell
set t_vb=
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
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
" Write contents of the file, if it has been modified, on buffer exit
set autowrite

"}}}
" fix multiple cursors clash with deoplete
if has("nvim")
  function Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
  endfunction
  function Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
  endfunction
endif
" nvim terminal
if has("nvim")
  tnoremap ,. <C-\><C-N>
  tnoremap ,ss <C-\><C-N>gt
  tnoremap <C-H> <C-\><C-N><C-W>h
  tnoremap <C-J> <C-\><C-N><C-W>j
  tnoremap <C-K> <C-\><C-N><C-W>k
  tnoremap <C-L> <C-\><C-N><C-W>l
  " go to insert mode at terminal, leave when leave
  au BufWinEnter,WinEnter term://* startinsert
  au BufLeave term://* stopinsert
endif

" Searching: {{{

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
" Use indent of 2 spaces by default
set tabstop=2
set shiftwidth=2
" set expandtab
" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces " Round indent to a multiple of shiftwidth
set shiftround
" Enable modeline (nocompatible should already enable this,
" but sometimes it is disabled)
set modeline
if has('clipboard')
  if has('unnamedplus')
    " By default, Vim will not use the system clipboard when yanking/pasting to
    " the default register. This option makes Vim use the system default
    " clipboard.
    " Note that on X11, there are _two_ system clipboards: the "standard" one, and
    " the selection/mouse-middle-click one. Vim sees the standard one as register
    " '+' (and this option makes Vim use it by default) and the selection one as
    " '*'.
    " See :h 'clipboard' for details.
    set clipboard=unnamedplus,unnamed
  else
    " Vim now also uses the selection system clipboard for default yank/paste.
    set clipboard+=unnamed
  endif
endif
" Jump to matching bracket for 3/10th of a second (works with showmatch)
set showmatch
set matchtime=3
" Allow buffer changing (:bp etc.) without saving
set hidden
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
" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha
" Don't continue comments when pressing o/O
set formatoptions-=r
" Don't continue comments when pressing <Enter>
set formatoptions-=o
" Recognize numbered lists when formatting
set formatoptions+=n

set grepprg=rg\ --vimgrep
"}}}

" Mappings: {{{

" <leader>2 switches indent to 2 spaces
nmap <leader>2 :set tabstop=2<CR>:set shiftwidth=2<CR>
" <leader>4 switches indent to 4 spaces
nmap <leader>4 :set tabstop=4<CR>:set shiftwidth=4<CR>

" Easy jump between bracket pairs by pressing TAB
nnoremap <Tab> %
vnoremap <Tab> %

" Jump to end / beginning in normal mode
inoremap <C-e> <C-o>A
inoremap <C-a> <C-o>^

" movement around windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" <leader>v vertically splits current window in two
noremap <leader>v :vsplit<CR>
" <leader>h horizontally splits current window in two
noremap <leader>h :split<CR>
" <leader>c closes current window
noremap <leader>c :close<CR>

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
nmap <silent> <leader><Space> :call ClearTrailingWhitespace()<CR>
" Clear ^M from dos fileformat and replace with \r
nmap <silent> <leader>df :%s/\r\(\n\)/\1/ge<CR>

" Try to live without Esc
inoremap ,. <Esc>
vnoremap ,. <Esc>

" Close help and git window by pressing q.
autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref nnoremap <buffer> q <C-W>c
autocmd FileType * if &readonly | nnoremap <buffer> q <C-W>c | endif

" Stop search highlighting
map <silent> <Esc><Esc> :nohlsearch<CR>
" Close current buffer
" nmap <leader>b :bd<CR>
" Save changes (forced for readonly files)
map <leader>w :w!<CR>
" Exit without saving
map <leader>q :qa!<CR>
" Fast editing of .vimrc
map <leader>fed :edit! ~/.vimrc<CR>
" Display all lines with word under cursor and ask which one to jump to
" nmap <leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
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
nmap <leader>ml :call AppendModeline()<CR>

" Insert the path of the currently edited file into a command line
" FIXME: remaps a binding for previos entry
" cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" Opens an edit command with the path of the currently edited file filled in
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Open in Firefox
" map <leader>ff :! open -a Firefox.app %:p<cr><cr>
" Open in Chrome
" map <leader>cc :! open -a 'Google Chrome.app' %:p<cr><cr>
" Open in Opera
" map <leader>oo :! open -a Opera.app %:p<cr><cr>
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
let g:prettier#config#bracket_spacing = 'true'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = 'Path to your EditorConfig Core executable'

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'iced' ]],
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'iced'    : 'iced#status'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'tabline': { 'left': [[ 'tabs' ]], 'right': [[ 'bufnum' ]] }
      \ }


function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 200)
call deoplete#custom#option('smart_case', v:true)

" <TAB>: completion.
" imap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ deoplete#mappings#manual_complete()
" function! s:check_back_space() "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

let g:neosnippet#snippets_directory='~/.vim/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" vaffle.vim
" If enabled, changes the working directory to selected one automatically.
" let g:vaffle_auto_cd = 1
" a dirvish-like mapping
nnoremap <silent> - :execute 'Vaffle ' . ((strlen(bufname('')) == 0) ? '.' : '%:h')<CR>

" rainbow parentheses
let g:rainbow_active = 1

" vim-javascript
let g:jsx_ext_required = 0

" clj-async.nvim
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" Use deoplete
let g:tern_request_timeout = 1
" Use tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

if has("cscope")
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
endif

" vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

" git-related mappings
nnoremap <Leader>gv :GV
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gf :Gpull<CR>
nnoremap <Leader>gW :Gwrite<CR>:Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gD :Gvdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" Clojure
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}

let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,GET,POST,PUT,DELETE,HEAD,ANY'
let g:clojure_maxlines = 0

let g:iced_enable_auto_linting = v:true

let b:ale_linters = {'clojure': ['joker']}

au Filetype clojure nmap <Leader>rr :Require<cr><cr>
au Filetype clojure nmap <Leader>rf :Require!<cr><cr>
au Filetype clojure nmap <Leader>rc :Console!<cr><cr>

let g:investigate_url_for_clojure="https://clojuredocs.org/search?q=^s"

" vim-grepper
" nnoremap <leader>sa :Grepper -tool ag<cr>
" nnoremap <leader>sab :Grepper -tool ag -buffers<cr>
" nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

" nmap gs <plug>(GrepperOperator)
" xmap gs <plug>(GrepperOperator)

" FZF
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* F call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>s :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nmap <leader>* :F <C-R>=expand("<cword>")<cr><cr>
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file)
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Sparkup
let g:sparkupNextMapping='<C-f>'

" CScope.
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

" <F4> to toggle Tagbar window
nmap <F4> :TagbarToggle<CR>

" Commands:

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable per-directory .vimrc files and disable unsafe commands in them (:h secure)
set exrc
set secure

" vim: set ts=2 sw=2 fdm=marker expandtab:
