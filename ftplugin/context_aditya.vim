set wildignore=*.aux,*.bbl,*.blg,*.tu?,*.tmp,*.top,*.log,*.dvi,*.ps,*.pdf,*.*.bak,*-mpgraph.*,*.*.keep,*.mp?,*.1,*.2,*.3,*.*.md5,*-*.mp,*.pgf
setlocal spell
setlocal isk=a-z,A-Z,:,!,@

" ==============================================================================
" mappings
" ==============================================================================

" Reformat lines (getting the spacing correct) {{{
fun! TeX_fmt()
	if (getline(".") != "")
    let save_cursor = getpos(".")
		let op_wrapscan = &wrapscan
		set nowrapscan
		let par_begin = '^\(%D\)\=\s*\($\|\\start\|\\stop\|\\Start\|\\Stop\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
		let par_end   = '^\(%D\)\=\s*\($\|\\start\|\\stop\|\\Start\|\\Stop\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
		norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
		let &wrapscan = op_wrapscan
    call setpos('.', save_cursor) 
	endif
endfun

nmap Q :call TeX_fmt()<CR>
vmap Q gw

" }}}

" Alignment mapping {{{
function! Context_Align()
  " Use marks y, z ; save them
  let mykeep      = SaveMark("'y")
  let mzkeep      = SaveMark("'z")
  let msearchkeep = @/

  " Search for the beginning of the [ Assume that [ starts on a line of its
  " own.
  norm! j
  call search('\(^\s*\[\|\[\s*$\|^\s*$\)', "bW")
  norm! my%mz%
  " Flatten the line
  sil! 'y,'zs/\({[^}]\{-}\)\@<!,\([^{]\{-}}\|\s*$\)\@!/\0\r/g
  " Check if everything is in one line
  norm! 'y%mz'y
  if line("'z")-line("'y") > 1
    " Add a newline after the first [
    sil! s/\[\(\s*$\)\@!/\0\1\r/
    let beginspace = matchstr(getline("'y"),'^\zs\s*\ze\[')
    let beginspace = substitute(beginspace, '.', ' ', 'g')
    if beginspace == ""
      let beginspace = "    "
      let onitsown = 0
    else
      let onitsown = 1
    end
    norm! `y%mz
    sil! s/\(^\s*\)\@<!\(,\)\=\]\s*$/,\r\]
    norm! `y%mz
    exe 'sil! s/^\s*/' . beginspace 
    AlignPush
    AlignCtrl g =
    AlignCtrl r:lp0P0w =
    sil! 'y+1,'z-1 Align
    AlignPop
    exe "'y+1,'z-1s/^/" . beginspace . ' '
    let spaceuntilequal = matchstr(getline(line("'y")+1),'.\{-}=') 
    let spaceuntilequal = substitute(spaceuntilequal, '.', ' ', 'g')
    exe "'y+1,'z-1v/=/s/^\\s*/" . spaceuntilequal . ' '
    if onitsown
      norm! 'yjr[kddmy
    end
  end


  let @/ = msearchkeep 
"  call RestoreMark(mykeep)
"  call RestoreMark(mzkeep)
endfunction

map <silent> <Leader>== :silent call Context_Align()<CR>

" }}}

" Vim: encoding=utf-8
