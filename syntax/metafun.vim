" Vim syntax file
" Language:	Metafun
" Maintainer:	Aditya Mahajan <adityam at umich do edu>
" Last Change:	January 27, 2010

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

" Read the Metapost syntax to start with
if version < 600
  source <sfile>:p:h/mp.vim
else
  runtime! syntax/mp.vim
endif

" Keywords defined my metafun
syn keyword mpType newboolean newnumeric newpair newpath newpen newpicture newstring newtransform

" Define the default highlighting
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mf_syntax_inits")
  if version < 508
    let did_mf_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mpType	Type

  delcommand HiLink
endif

let b:current_syntax = "metafun"

" vim: ts=8
