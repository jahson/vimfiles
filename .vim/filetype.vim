"
" Filetype detection
"
augroup filetypedetect
	" Detect .txt as 'text'
	 autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END

" vim: set ts=4 sw=4 noexpantab:
