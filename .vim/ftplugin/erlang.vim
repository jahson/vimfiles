setlocal keywordprg=erl\ -man

if !exists( "g:manpageview_pgm_erl" )
    let g:manpageview_pgm_erl = "erl"
    let g:manpageview_options_erl = "-man"
endif
