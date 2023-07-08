" Vim syntax file
" Language:	Metafun
" Maintainer:	Aditya Mahajan <adityam at umich do edu>
" Last Change:	2023.07.08

if exists("b:current_syntax")
  finish
endif

" Read the Metapost syntax to start with
runtime! syntax/mp.vim

" Keywords defined my metafun
syn keyword mpType newboolean newnumeric newpair newpath newpen newpicture newstring newtransform

hi def link mpType Type

let b:current_syntax = "metafun"

" vim: ts=8
