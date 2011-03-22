" Fix matchpairs for PHP (for matchit.vim plugin)
if exists("loaded_matchit")
	let b:match_skip = 's:comment\|string'
	let b:match_words = '<?\(php\)\?:?>,\<switch\>:\<endswitch\>,' .
		\ '\<if\>:\<elseif\>:\<else\>:\<endif\>,' .
		\ '\<while\>:\<endwhile\>,\<do\>:\<while\>,' .
		\ '\<for\>:\<endfor\>,\<foreach\>:\<endforeach\>' .
		\ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
		\ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
		\ '<\@<=\([^/?][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
		\ '<:>'
endif

" Use PHP syntax check when doing :make
setlocal makeprg=php\ -l\ %

" Parse PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" vim: set ts=4 sw=4 noexpandtab:
