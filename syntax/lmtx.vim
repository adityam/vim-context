" Vim syntax file
" Language:	LMTX
" Maintainer:	Aditya Mahajan <adityam at umich do edu>
" Last Change:	2023.07.08

if exists("b:current_syntax")
  finish
endif

" Read the Metapost syntax to start with
runtime! syntax/lua.vim

let b:current_syntax = "lmtx"

" vim: ts=8
