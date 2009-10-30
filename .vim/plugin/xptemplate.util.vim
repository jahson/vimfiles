if exists("g:__XPTEMPLATE_UTIL_VIM__")
  finish
endif
let g:__XPTEMPLATE_UTIL_VIM__ = 1
let s:oldcpo = &cpo
set cpo-=< cpo+=B
runtime plugin/debug.vim
runtime plugin/xpclass.vim
let s:log = CreateLogger( 'warn' )
let g:XPTsid = 'map <Plug>xsid <SID>|let s:sid=matchstr(maparg("<Plug>xsid"), "\\d\\+_")|unmap <Plug>xsid'
exe g:XPTsid
let s:unescapeHead          = '\v(\\*)\1\\?\V'
fun! g:XPclassPrototype( sid, ...) 
    let p = {}
    for name in a:000
        let p[ name ] = function( '<SNR>' . a:sid . name )
    endfor
    return p
endfunction 
fun! s:UnescapeChar( str, chars ) 
    let chars = substitute( a:chars, '\\', '', 'g' )
    let pattern = s:unescapeHead . '\(\[' . escape( chars, '\]-^' ) . ']\)'
    let unescaped = substitute( a:str, pattern, '\1\2', 'g' )
    return unescaped
endfunction 
fun! s:DeepExtend( to, from ) 
    for key in keys( a:from )
        if type( a:from[ key ] ) == 4
            if has_key( a:to, key )
                call g:xptutil.DeepExtend( a:to[ key ], a:from[ key ] )
            else
                let a:to[ key ] = a:from[key]
            endif
        elseif type( a:from[key] ) == 3
            if has_key( a:to, key )
                call extend( a:to[ key ], a:from[key] )
            else
                let a:to[ key ] = a:from[key]
            endif
        else
            let a:to[ key ] = a:from[key]
        endif
    endfor
endfunction 
fun! s:XPTgetCurrentOrPreviousSynName() 
    let pos = [ line( "." ), col( "." ) ]
    let synName = synIDattr(synID(pos[0], pos[1], 1), "name")
    if synName == ''
        let prevPos = searchpos( '\S', 'bWn' )
        if prevPos == [0, 0]
            return synName
        endif
        let synName = synIDattr(synID(prevPos[0], prevPos[1], 1), "name")
        if synName == ''
            return &filetype
        endif
    endif
    return synName
endfunction 
let g:xptutil = g:XPclass( s:sid, {} )
let &cpo = s:oldcpo
