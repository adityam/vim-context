if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim
let bt = st.et
let si = IMAP_GetPlaceHolderStart()
let ei = IMAP_GetPlaceHolderEnd()

exec "Snippet for \\startformula<CR>".st.et."<CR>\\stopformula".si.ei
exec "Snippet pfor \\placeformula[".st."tag".et."] \\startformula<CR>".st.et."<CR>\\stopformula".si.ei

exec "Snippet fora \\startformula \\startalign<CR>".st.et."<CR>\\stopalign \\stopformula".si.ei
exec "Snippet pfora \\placeformula[".st."tag".et."] \\startformula \\startalign<CR>".st.et."<CR>\\stopalign \\stopformula".si.ei


" For specific project
exec "Snippet FL \\FIELD ".bt
exec "Snippet AL \\ALPHABET ".bt
exec "Snippet FS \\FSPACE ".bt
exec "Snippet WN \\WINDOW ".bt

" exec "Snippet sub \\subsection{".st."name".et."}\\label{sub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
" exec "Snippet $$ \\[<CR>".st.et."<CR>\\]<CR>".st.et
" exec "Snippet ssub \\subsubsection{".st."name".et."}\\label{ssub:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
" exec "Snippet itd \\item[".st."desc".et."] ".st.et
" exec "Snippet sec \\section{".st."name".et."}\\label{sec:".st."name:substitute(@z,'.','\\l&','g')".et."}<CR>".st.et
