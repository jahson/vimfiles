"
" Settings for PHP filetype
"

setlocal textwidth=79

" Help tuning
setlocal keywordprg=pman
if !exists( "g:manpageview_pgm_php" )
    let g:manpageview_pgm_php = "pman"
endif

" Completion dictionary
setlocal dictionary+=~/.vim/dictionaries/php.dict

" Load PHP Documentor for VIM
"source ~/.vim/php-doc.vim

" Set up automatic formatting
setlocal formatoptions+=tcqlro

"
" Syntax options
"

" Enable folding of class/function blocks
let php_folding = 1

" Do not use short tags to find PHP blocks
"let php_noShortTags = 0

" Highlighti SQL inside PHP strings
let php_sql_query = 1

" Function to locate endpoints of a PHP block {{{
function! PhpBlockSelect(mode)
	let motion = "v"
	let line = getline(".")
	let pos = col(".")-1
	let end = col("$")-1

	if a:mode == 1
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			let motion .= "l"
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			" do nothing
		else
			let motion .= "/?>/e\<CR>"
		endif
		let motion .= "o"
		if end > 0
			let motion .= "l"
		endif
		let motion .= "?<\\?php\\>\<CR>"
	else
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			" do nothing
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			let motion .= "h?\\S\<CR>""
		else
			let motion .= "/?>/;?\\S\<CR>"
		endif
		let motion .= "o?<\\?php\\>\<CR>4l/\\S\<CR>"
	endif

	return motion
endfunction
" }}}

" Mappings for faster writing
imap <C-j> $this->
imap <C-u> ->

" Mappings to select full/inner PHP block
nmap <silent> <expr> vaP PhpBlockSelect(1)
nmap <silent> <expr> viP PhpBlockSelect(0)
" Mappings for operator mode to work on full/inner PHP block
omap <silent> aP :silent normal vaP<CR>
omap <silent> iP :silent normal viP<CR>

" Mappings for PHP Documentor for VIM
inoremap <buffer> <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <buffer> <C-P> :call PhpDocSingle()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

let g:pdv_cfg_Uses = 1 " Generate @uses tag based on inheritance info
let g:pdv_cfg_Author = "Oleg Roschupkin <jjahson@gmail.com>"
let g:pdv_cfg_Copyright = "2011"

" Exuberant Ctags
"
" Map <F4> to re-build tags file
nmap <silent> <F4>
		\ :!ctags -f ./tags 
		\ --langmap="php:+.inc"
		\ -h ".php.inc" -R --totals=yes
		\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

" Set tag filename(s)
setlocal tags=./tags,tags

" Run PHP in cli
"autocmd filetype php nmap <leader>r :w!<CR>:!php %<CR>
nmap <leader>r :w!<CR>:!php %<CR>

" vim: set ts=4 sw=4 fdm=marker:
