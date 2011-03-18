if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	" Detect .txt as 'text'
	 autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END

" vim: set ts=4 sw=4 noexpandtab:
