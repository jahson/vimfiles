" Completion dictionary
setlocal dictionary+=~/.vim/dictionaries/erlang_base.vim
setlocal dictionary+=~/.vim/dictionaries/erlang.vim

" Use erl -manan for K
setlocal keywordprg=erl\ -man

if !exists( "g:manpageview_pgm_erl" )
  let g:manpageview_pgm_erl = "erl"
  let g:manpageview_options_erl = "-man"
endif

" vim: set ts=2 sw=2:
