setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

if filereadable( '/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc' )
    " Yes, I'm on mac
    setlocal makeprg=/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc\ ~/.vim/jslint_runner.js\ <\ %:p
    setlocal errorformat=Line\ %l\ column\ %c:\ %m
endif
