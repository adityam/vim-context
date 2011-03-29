" Vim compiler file
" Language:    ConTeXt (file type context)
" Maintainer:  Aditya Mahajan <adityam [at] umich [dot] edu>
" Last Change: 2007-06-17

if exists("current_compiler") && current_compiler =~ 'texexec'
  finish
endif

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let current_compiler = 'texexec'
let &l:makeprg = 'texmfstart texexec --nonstopmode --passon=-file-line-error $*'

let s:cpo_save = &cpo
set cpo-=C      "Allow line-continuation

CompilerSet errorformat=
      \%+Asystem\ %#:\ module\ %m\ not\ found,
      \%E%>%f:%l:\ %m,
      \%Cl.%l\ %m,
      \%+C\ \ %m.,
      \%+C%.%#-%.%#,
      \%+C%.%#[]%.%#,
      \%+C[]%.%#,
      \%+C%.%#%[{}\\]%.%#,
      \%+C<%.%#>%.%#,
      \%GOutput\ written\ on\ %m,
      \%GTeXExec\ \|\ run%m

let &cpo = s:cpo_save
unlet s:cpo_save
