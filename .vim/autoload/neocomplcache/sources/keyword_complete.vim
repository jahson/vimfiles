"=============================================================================
" FILE: keyword_complete.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu@gmail.com>
" Last Modified: 10 Jul 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

let s:source = {
      \ 'name' : 'keyword_complete',
      \ 'kind' : 'complfunc',
      \}

function! s:source.initialize()"{{{
  " Set rank.
  call neocomplcache#set_variable_pattern('g:neocomplcache_plugin_rank', 'keyword_complete', 5)
  
  " Initialize.
  for l:plugin in values(neocomplcache#available_plugins())
    call l:plugin.initialize()
  endfor
endfunction"}}}
function! s:source.finalize()"{{{
  for l:plugin in values(neocomplcache#available_plugins())
    call l:plugin.finalize()
  endfor
endfunction"}}}

function! s:source.get_keyword_pos(cur_text)"{{{
  let l:pattern = neocomplcache#get_keyword_pattern_end()

  let l:cur_keyword_pos = match(a:cur_text, l:pattern)
  if g:neocomplcache_enable_wildcard
    " Check wildcard.
    let l:cur_keyword_pos = neocomplcache#match_wildcard(a:cur_text, l:pattern, l:cur_keyword_pos)
  endif

  return l:cur_keyword_pos
endfunction"}}}

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)"{{{
  if neocomplcache#is_eskk_enabled() && !neocomplcache#is_text_mode()
    return []
  endif
  
  " Get keyword list.
  let l:cache_keyword_list = []
  for [l:name, l:plugin] in items(neocomplcache#available_plugins())
    if !has_key(g:neocomplcache_plugin_completion_length, l:name)
          \|| !neocomplcache#is_auto_complete()
          \|| len(a:cur_keyword_str) >= g:neocomplcache_plugin_completion_length[l:name]
      let l:list = l:plugin.get_keyword_list(a:cur_keyword_str)
      let l:rank = has_key(g:neocomplcache_plugin_rank, l:name)? 
              \ g:neocomplcache_plugin_rank[l:name] : g:neocomplcache_plugin_rank['keyword_complete']
      for l:keyword in l:list
        let l:keyword.rank = l:rank
      endfor
      let l:cache_keyword_list += l:list
    endif
  endfor

  return l:cache_keyword_list
endfunction"}}}

function! neocomplcache#sources#keyword_complete#define()"{{{
  return s:source
endfunction"}}}

" vim: foldmethod=marker
