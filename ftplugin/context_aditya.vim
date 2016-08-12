set wildignore=*.aux,*.bbl,*.blg,*.tu?,*.tmp,*.top,*.log,*.dvi,*.ps,*.pdf,*.*.bak,*-mpgraph.*,*.*.keep,*.mp?,*.1,*.2,*.3,*.*.md5,*-*.mp,*.pgf
setlocal spell
setlocal isk=a-z,A-Z,:,!,@

compiler texexec

" ==============================================================================
" mappings
" ==============================================================================

" calculate the mapleader character.
let g:Tex_Leader = '`'

if !exists('s:doneMappings')
	let s:doneMappings = 1
	" short forms for latex formatting and math elements. {{{
	" taken from auctex.vim or miktexmacros.vim
	" call IMAP ('__', '_{<++>}<++>', 'context')
	" call IMAP ('()', '(<++>)<++>', 'context')
	" call IMAP ('[]', '[<++>]<++>', 'context')
	" call IMAP ('{}', '{<++>}<++>', 'context')
	" call IMAP ('^^', '^{<++>}<++>', 'context')
	" call IMAP ('$$', '$<++>$<++>', 'context')
	" call IMAP ('==', '&=& ', 'context')
	" call IMAP ('~~', '&≈& ', 'context')
	" call IMAP ('=~', '≈', 'context')
	" call IMAP ('::', '…', 'context')
	" call IMAP ('((', '\left( <++> \right)<++>', 'context')
	" call IMAP ('[[', '\left[ <++> \right]<++>', 'context')
	" call IMAP ('{{', '\left\{ <++> \right\}<++>', 'context')
	call IMAP (g:Tex_Leader.'^', '\hat', 'context')
	call IMAP (g:Tex_Leader.'_', '\bar', 'context')
	call IMAP (g:Tex_Leader.'6', '∂', 'context')
	call IMAP (g:Tex_Leader.'8', '∞', 'context')
	call IMAP (g:Tex_Leader.'/', '\frac{<++>}{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'%', '\frac{<++>}{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'@', '∘', 'context')
	call IMAP (g:Tex_Leader.'0', '^∘', 'context')
	call IMAP (g:Tex_Leader.'=', '≡', 'context')
	call IMAP (g:Tex_Leader."\\",'∖', 'context')
	call IMAP (g:Tex_Leader.'.', '⋅', 'context')
	call IMAP (g:Tex_Leader.'*', '×', 'context')
	call IMAP (g:Tex_Leader.'&', '∧', 'context')
	call IMAP (g:Tex_Leader.'-', '⋂', 'context')
	call IMAP (g:Tex_Leader.'+', '⋃', 'context')
	call IMAP (g:Tex_Leader.'M', '∑_{<++>}^{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'S', '∑_{<++>}^{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'(', '⊂', 'context')
	call IMAP (g:Tex_Leader.')', '⊃', 'context')
	call IMAP (g:Tex_Leader.'<', '\le', 'context')
	call IMAP (g:Tex_Leader.'>', '\ge', 'context')
	call IMAP (g:Tex_Leader.',', '\nonumber', 'context')
	call IMAP (g:Tex_Leader.'~', '\tilde', 'context')
	call IMAP (g:Tex_Leader.';', '\dot', 'context')
	call IMAP (g:Tex_Leader.':', '\ddot{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'2', '\sqrt{<++>}<++>', 'context')
	call IMAP (g:Tex_Leader.'|', '\Big|', 'context')
	call IMAP (g:Tex_Leader.'I', "∫_{<++>}^{<++>}<++>", 'context')
	" }}}
	" Greek Letters {{{
	call IMAP(g:Tex_Leader.'a', 'α', 'context')
	call IMAP(g:Tex_Leader.'b', 'β', 'context')
	call IMAP(g:Tex_Leader.'c', 'χ', 'context')
	call IMAP(g:Tex_Leader.'d', 'δ', 'context')
	call IMAP(g:Tex_Leader.'e', 'ε', 'context')
	call IMAP(g:Tex_Leader.'f', 'φ', 'context')
	call IMAP(g:Tex_Leader.'g', 'γ', 'context')
	call IMAP(g:Tex_Leader.'h', 'η', 'context')
	call IMAP(g:Tex_Leader.'k', 'κ', 'context')
	call IMAP(g:Tex_Leader.'l', 'λ', 'context')
	call IMAP(g:Tex_Leader.'m', 'μ', 'context')
	call IMAP(g:Tex_Leader.'n', 'ν', 'context')
	call IMAP(g:Tex_Leader.'p', 'π', 'context')
	call IMAP(g:Tex_Leader.'q', 'θ', 'context')
	call IMAP(g:Tex_Leader.'r', 'ρ', 'context')
	call IMAP(g:Tex_Leader.'s', 'σ', 'context')
	call IMAP(g:Tex_Leader.'t', 'τ', 'context')
	call IMAP(g:Tex_Leader.'u', 'υ', 'context')
	call IMAP(g:Tex_Leader.'v', 'ς', 'context')
	call IMAP(g:Tex_Leader.'w', 'ω', 'context')
	" call IMAP(g:Tex_Leader.'w', '∧', 'context')  " AUCTEX style
	call IMAP(g:Tex_Leader.'x', 'ξ', 'context')
	call IMAP(g:Tex_Leader.'y', 'ψ', 'context')
	call IMAP(g:Tex_Leader.'z', 'ζ', 'context')
	" not all capital greek letters exist in LaTeX!
	" reference: http://www.giss.nasa.gov/latex/ltx-405.html
	call IMAP(g:Tex_Leader.'D', 'Δ', 'context')
	call IMAP(g:Tex_Leader.'F', 'Φ', 'context')
	call IMAP(g:Tex_Leader.'G', 'Γ', 'context')
	call IMAP(g:Tex_Leader.'P', 'Π', 'context')
	call IMAP(g:Tex_Leader.'Q', 'Θ', 'context')
	call IMAP(g:Tex_Leader.'L', 'Λ', 'context')
	call IMAP(g:Tex_Leader.'X', 'Ξ', 'context')
	call IMAP(g:Tex_Leader.'Y', 'Ψ', 'context')
	call IMAP(g:Tex_Leader.'S', '\Sigma', 'context')
	call IMAP(g:Tex_Leader.'U', 'Υ', 'context')
	call IMAP(g:Tex_Leader.'W', 'Ω', 'context')
	" }}}
	" ProtectLetters: sets up indentity maps for things like ``a {{{
	" " Description: If we simply do
	" 		call IMAP('`a', 'α', 'context')
	" then we will never be able to type 'a' after a tex-quotation. Since
	" IMAP() always uses the longest map ending in the letter, this problem
	" can be avoided by creating a fake map for ``a -> ``a.
	" This function sets up fake maps of the following forms:
	" 	``[aA]  -> ``[aA]    (for writing in quotations)
	" 	\`[aA]  -> \`[aA]    (for writing diacritics)
	" 	"`[aA]  -> "`[aA]    (for writing german quotations)
	" It does this for all printable lower ascii characters just to make sure
	" we dont let anything slip by.
	function! s:ProtectLetters(first, last)
		let i = a:first
		while i <= a:last
			if nr2char(i) =~ '[[:print:]]'
				call IMAP('``'.nr2char(i), '``'.nr2char(i), 'context')
				call IMAP('\`'.nr2char(i), '\`'.nr2char(i), 'context')
				call IMAP('"`'.nr2char(i), '"`'.nr2char(i), 'context')
			endif
			let i = i + 1
		endwhile
	endfunction 
	" call s:ProtectLetters(32, 127)
	" }}}
	" vmaps: enclose selected region in brackets, environments {{{ 
	" The action changes depending on whether the selection is character-wise
	" or line wise. for example, selecting linewise and pressing \v will
	" result in the region being enclosed in \begin{verbatim}, \end{verbatim},
	" whereas in characterise visual mode, the thingie is enclosed in \verb|
	" and |.
	exec 'vnoremap <silent> '.g:Tex_Leader."( \<C-\\>\<C-N>:call VEnclose('\\left( ', ' \\right)', '\\left(', '\\right)')\<CR>"
	exec 'vnoremap <silent> '.g:Tex_Leader."[ \<C-\\>\<C-N>:call VEnclose('\\left[ ', ' \\right]', '\\left[', '\\right]')\<CR>"
	exec 'vnoremap <silent> '.g:Tex_Leader."{ \<C-\\>\<C-N>:call VEnclose('\\left\\{ ', ' \\right\\}', '\\left\\{', '\\right\\}')\<CR>"
	exec 'vnoremap <silent> '.g:Tex_Leader."$ \<C-\\>\<C-N>:call VEnclose('$', '$', '\\[', '\\]')\<CR>"
	" }}}
end

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
