"
" General things that should be done at the very end, to override plugin
" settings
"

" Function to do <Tab> or completion, based on context {{{
function MyTabOrComplete()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<tab>"
	else
		return "\<C-N>"
	endif
endfunction
" }}}

"
" Map CTRL-B to snippetsEmu and use <Tab> for our smart completion
if exists('loaded_snippet')
	imap <C-B> <Plug>Jumper
endif
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

"
" Customize taglist settings
if exists('loaded_taglist')
	let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
	let Tlist_Enable_Fold_Column = 0
	let Tlist_Exit_OnlyWindow = 1
	let Tlist_File_Fold_Auto_Close = 1
	let Tlist_Inc_Winwidth = 1
	let Tlist_Max_Submenu_Items = 15
	let Tlist_WinWidth = 45
	let tlist_php_settings = 'php;c:class;d:constant;f:function'

	" map <F6> to toggle taglist window
	nmap <silent> <F6> :TlistToggle<CR>
endif

" Set CVS executable for VCSCommand plugin
"if exists('loaded_VCSCommand')
"	let VCSCommandCVSExec="cvs"
"endif

" vim: set fdm=marker:
