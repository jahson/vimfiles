set tabstop=4
set shiftwidth=4
set noexpandtab

if filereadable( '/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc' )
    " Yes, I'm on mac
    set makeprg=/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc\ ~/.vim/jslint_runner.js\ <\ %:p
    set errorformat=Line\ %l\ column\ %c:\ %m
endif
