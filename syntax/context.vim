" Vim syntax file
" Language:         ConTeXt typesetting engine
" Maintainer:       Aditya Mahajan (adityam@umich.edu)
" Latest Revision:  2008-08-26

if exists("b:current_syntax")
  finish
endif


let s:cpo_save = &cpo
set cpo&vim

syn keyword contextTodo       TODO FIXME XXX NOTE TODO: FIXME: XXX: NOTE:

syn match  contextComment    '\\\@!%.*' display contains=contextTodo

syn match  contextComment    '^%[CDM]\s.*' contains=ALLBUT,contextComment,contextArgument contains=@Spell

syn match   contextStatement  display '\\[a-zA-Z@!]\+'

syn match   contextBlockDelim display '\\\%(start\|stop\|place\)\a\+\_s*' nextgroup=contextArgument

syn match   contextDelimiter  '[][{}]'

syn match   contextEscaped    display '\\\_[\{}|&%$ ]'

syn region  contextEscaped    display matchgroup=contextPreProc
                              \ start='\\type\z(\A\)' end='\z1'

syn region  contextEscaped    display matchgroup=contextPreProc
                              \ start='\\\%(type\|filename\){' end='}'

syn region  contextEscaped    display matchgroup=contextPreProc
                              \ start='\\type<<' end='>>'

syn region  contextEscaped    extend matchgroup=contextPreProc
                              \ start='\\start\z(\a*\%(typing\|typen\)\)'
                              \ end='\\stop\z1' 
"                              \ skip='^%[CDM] '

syn match  contextTextSpecial     '\\\%(cite\|date\|pagereference\|eqref\|about\)\>' nextgroup=contextArgument

syn match  contextTextSpecial  '\\\%(in\|at\)\>\_s*{\=\a*}\=\_s*'he=s+3 nextgroup=contextArgument

syn region contextArgument    matchgroup=contextDelimiter 
          \ nextgroup=contextArgument
          \ start='\_s*\[' skip='{.\{-\}].\{-}}' end=']\_s*' contained
          \ contains=contextGroup,contextComment

syn match  contextSpecial     '\\\%(infull\|executesystemcommand\)' nextgroup=contextGroup

syn region contextGroup       matchgroup=contextDelimiter 
                              \ start='{' skip='\\}' end='}' 
                              \ contained
                              \ contains=contextStatement

syn region  contextMath       matchgroup=contextMath start='\$' end='\$'
                              \ contains=contextStatement,contextIdentifier,contextSpecial,contextComment,contextMathtext,contextEscaped

syn region  contextMath       matchgroup=contextIdentifier 
                              \ start='\\start\z([sm][pd]\)\=formula' end='\\stop\z1formula'
                              \ contains=contextIdentifier,contextStatement,contextSpecial,contextComment,contextMathtext,contextEscaped

syn region contextMathtext    matchgroup=contextIdentifier 
      \ start="\\\%(inter\)\=text\>{" end="}"
      \ contains=contextMath,contextIdentifier,contextStatement,contextSpecial,contextComment
      \ contained

syn match  contextIdentifier  '\\\%(start\|stop\)\%(math\)\=\%(align\|alignment\|\a\=matrix\)\>'


syn match   contextBuiltin    '\\\%(newif\|def\|gdef\|global\|let\|glet\|bgroup\)\>'

syn match   contextBuiltin    '\\\%(begingroup\|egroup\|endgroup\|long\|catcode\)\>'

syn match   contextBuiltin    '\\\%(unprotect\|unexpanded\|if\a\+\|else\|fi\|ifx\)\>' 

syn match   contextBuiltin    '\\\%(futurelet\|protect\|appendtoks\)\>' 
syn match   contextBuiltin    '\\\%([lr]q\)\>' 

syn match   contextPreProc    '^\s*\\\%(component\|environment\|\%(start\|stop\)environment\|project\|product\).*$'

syn match   contextIdentifier    '\\\%(setup\|define\|use\|enable\|disable\|setvariables\)\a*\_s*'
                              \ nextgroup=contextArgument

syn match   contextPreProc    '^\s*\\input\s\+.*$' 

syn match   contextSectioning '\\\(chapter\|part\)\>' nextgroup=contextArgument
syn match   contextSectioning '\\\%(sub\)*\(section\|subject\)\>' nextgroup=contextArgument

syn match   contextError      '\a\+|\a\+'

syn match   contextSpecial    '\\crlf\>\|\\par\>\|\\endgraf\>\|-\{2,3}\||[<>/]\=|'

syn match   contextSpecial    '\\[`'"]'
syn match   contextSpecial    +\\char\%(\d\{1,3}\|'\o\{1,3}\|"\x\{1,2}\)\>+

syn match   contextSpecial    '\^\^.'
"syn match   contextSpecial    '`\%(\\.\|\^\^.\|.\)'

syn match   contextSpecial    '\\NR' nextgroup=contextArgument
syn match   contextSpecial    '\\\%(EQ\|[FMLN]C\|[HV]L\|[SFML]R\|\)\>'
syn match   contextSpecial    '&'

syn match   contextStyle      '\\\%(em\|tt\|rm\|ss\|hw\|cg\|mf\)\>'

syn match   contextFont       '\\\%(CAP\|Cap\|cap\|Caps\|kap\|nocap\|smallcapped\|mono\)\>' 

syn match   contextFont       '\\\%(Word\|WORD\|Words\|WORDS\)\>'

syn match   contextFont       '\\\%(vi\{1,3}\|ix\|xi\{0,2}\)\>'

"syn match   contextFont       '\\\%(tf[abcdx]\|bfx\|[is]lx\)\>'

syn match   contextFont       '\\\%(tf\|b[fsi]\|s[cl]\|it\|os\)\%(\|[xabcd]\|xx\)\>'

" missing:
"  \tx, \txx, is \t[abcd] also possible?
"  \rmsl, \ssbf, \sssl, \tttf ... I didn't figure out yet how they are used
"  \rmd ...
"  is \em[xabcd] possible?
"  mm
"  ex, mi, sy - what's that?

syn match   contextDimension  '[+-]\=\s*\%(\d\+\%([.,]\d*\)\=\|[.,]\d\+\)\s*\%(true\)\=\s*\%(p[tc]\|in\|bp\|c[mc]\|mm\|dd\|sp\|e[mx]\)\>'

syn include @METAPOST syntax/mp.vim
unlet b:current_syntax


syn region  metapost  matchgroup=contextIdentifier 
                      \ start='\\start\z(\%(use\|reusabe\|usable\|unique\|static\)\=MP\%(code\|page\|inclusions\|graphic\|drawing\|run\|figure\|initializations\|definitions\)\)'
                      \ end='\\stop\z1'
                      \ contains=@METAPOST

syn include @LUA syntax/lua.vim
unlet b:current_syntax

syn region luatex matchgroup=contextIdentifier
      \ start='\\startluacode'
      \ end='\\stopluacode'
      \ contains=@LUA


syn region luatex matchgroup=contextIdentifier
      \ start='\\starttikzpicture'
      \ end='\\stoptikzpicture'
      \ contains=contextIdentifier,contextStatement,contextSpecial,contextComment,contextMath,contextEscaped

syn region  context  matchgroup=contextPreProc
                      \ start='\\start\z(text\|component\|product\|project\)\>.*$'
                      \ end='\\stop\z1'
                      \ skip='\\starttyping.\{-\}\\stoptyping'
                      \ keepend
                      \ contains=TOP


"" syn match contextURL '\\useURL\s*\[abc\]'

syn sync match contextSync  grouphere context ""


hi def link contextTodo       Todo
hi def link contextComment    Comment
hi def link contextEscaped    Special
hi def link contextStatement  Statement
hi def link contextMath       String
hi def link contextBlockDelim Keyword
hi def link contextBuiltin    Character
hi def link contextDelimiter  Delimiter
hi def link contextPreProc    PreProc
hi def link metapostDelim     PreProc
hi def link contextIdentifier Identifier
hi def link contextSectioning PreProc
hi def link contextSpecial    Special
hi def link contextTextSpecial contextSpecial
hi def link contextArgument   Type
hi def link contextStyle      contextType
hi def link contextFont       contextType
hi def link contextType       Type
hi def link contextDimension  Number
hi def link contextError      Error
hi def link contextMathtext   Normal

hi def link metafunBlock String
hi def link contextURL String

syn sync fromstart

let b:current_syntax = "context"

let &cpo = s:cpo_save
unlet s:cpo_save
