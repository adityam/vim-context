" TODO: Support Metapost with Metapost indentation
" Need to identify if we are in a metapost region
" and then use metapost indenting. The identification should be done by the 
" ftplugin.

if exists("b:did_indent") | finish
endif
let b:did_indent = 1


setlocal indentexpr=GetTeXIndent()
setlocal nolisp
setlocal nosmartindent
setlocal autoindent
setlocal indentkeys+=0=[,0=],0=\\item,0=\\head,0=\\txt,0=\\step,0=\\start,0=\Start,0=\\stop,0=\\Stop,0=\\stopitemize,0=\\NC,0=\\EQ,0=\\intertext


" Only define the function once
if exists("*GetTeXIndent") | finish
endif



function GetTeXIndent()

  " Find a non-blank line above the current line.
  let lnum  = prevnonblank(v:lnum - 1)
  let ind   = indent(lnum)
  let line  = getline(lnum)             " last line
  let cline = getline(v:lnum)          " current line

  " let lnum = v:lnum - 1

  " At the start of the file use zero indent.
  if v:lnum == 0 | return 0 | endif

  " Do not change indentation of commented lines.
  if line =~ '^\s*%'
    return ind
  endif


  " If there are two blank spaces, reduce indent by shift width. Useful for
  " \placefigure etc.
  if v:lnum - lnum > 2 | let ind = ind - &sw | endif

  " Add a 'shiftwidth' after beginning of environments.
  " Don't add it for \starttext, \startenvironment, \startcomponent, 
  " \startproject, \startproduct, \startbuffer
  if line =~ '^\s*\\\(start\|place\|intertext\|Start\)'  
        \ && line !~ '\\starttext'
        \ && line !~ '\\startenvironment'
        \ && line !~ '\\startcomponent'
        \ && line !~ '\\startproject'
        \ && line !~ '\\startproduct'
        \ && line !~ '\\startbuffer'
        \ && line !~ '\\startlines'
        \ && line !~ '\\stop\l\+\s*$'
    let ind = ind + &sw
  endif

  " Subtract shiftwidth when we have \place... \start...
  if cline =~ '^\s*\\start' && line =~ '^\s*\\place'
    let ind = ind - &sw
  endif


  " Subtract a 'shiftwidth' when an environment ends
  if cline =~ '^\s*\\\(stop\|Stop\)' 
        \ && line !~ '\\stoptext'
        \ && line !~ '\\stopenvironment'
        \ && line !~ '\\stopcomponent'
        \ && line !~ '\\stopproject'
        \ && line !~ '\\stopproduct'
        \ && line !~ '\\stopbuffer'
        \ && line !~ '\\stoplines'
    let ind = ind - &sw
    if line =~ '\\\(NC\|EQ\|NR\)\>'
      let ind = ind - &sw*2
    endif
  endif

  " If the current line starts with a '[' and the previous line ends with a
  " command 
  " or the previous line ends in a '[' add a shiftwidth
  " (Sometimes the code is more clear than comments)
  if (cline =~ '^\s*\[' && line =~'\\\w\+\s*$') || line=~'\[\s*%*\s*$'
    let ind = ind + &sw
  endif

  " If the current line starts with a ']' subtract a shiftwidth
  if cline =~ '^\s*\]'
    let ind = ind - &sw
  endif

  " If the current line starts with [ and the previous ended with ] indent to 
  " the previous [
  if cline =~ '^\s*\['
        \ && line =~'\]\s*$'
    let pos = match(line,'\[')
    if pos == -1
      let ind = ind - &sw
    else
      let ind = pos
    endif
  endif


  " Indent items as in tex plugin
  " Add another shiftwidth after itemize
  if line =~ '\\startitemize'
    let ind = ind + &sw
  endif
  " Remove another sw for itemize
  " Does not seem to work!
  if cline =~ '\\stopitemize'
    let ind = ind - &sw
  endif

  " Special treatment for 'item'
  if cline =~ '^\s*\\\(item\|step\|head\|sym\|headsym\|txt\|nop\)\>'
    let ind = ind - &sw
  endif
  " Lines following item are indented once again
  if line =~ '^\s*\\\(item\|step\|sym\|headsym\|head\|txt\)\>'
    let ind = ind + &sw
  endif

  " Special treatment for 'NC'
  if line =~ '^\s*\\\(NC\|EQ\)\>' && cline !~ '^\s*\\\(NC\|EQ\)\>'
    let ind = ind + &sw*2
  endif

  if cline =~ '^\s*\\\(NC\|EQ\)\>' && line !~ '^\s*\\\(NC\>\|EQ\>\|start\|place\|intertext\)'
    let ind = ind - &sw*2
  endif

  " Special treatment for 'intertext'
  if cline =~ '^\s*\\intertext'
    let ind = ind - &sw*3
  endif
  
  "If there is a [ in the previous line at the present indent position, 
  "increase the indent by 1

  if false

    if line[ind] == '\['
      let ind = ind + &sw/2
    endif

  endif

  return ind
endfunction

