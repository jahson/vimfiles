setlocal cindent
setlocal cinoptions=>s,{0,n0,(0
setlocal comments=sr:/*,mb:*,elx:*/,://
setlocal formatoptions=tcqrol

imap <F2> TSRMLS_CC
imap <F3> TSRMLS_DC

let c_syntax_for_h=1

setlocal makeprg=gcc
