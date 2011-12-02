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

exec  "Snippet sec  \\startsection[title={".st."title".et."}]<CR>".st.et."<CR>\\stopsection".si.ei
exec  "Snippet sec2  \\startsubsection[title={".st."title".et."}]<CR>".st.et."<CR>\\stopsubsection".si.ei
exec  "Snippet sec3  \\startsubsubsection[title={".st."title".et."}]<CR>".st.et."<CR>\\stopsubsubsection".si.ei

exec  "Snippet item  \\startitemize".st.et."<CR>\\stopitemize".si.ei

" For specific project
exec "Snippet FL \\FIELD ".bt
exec "Snippet AL \\ALPHABET ".bt
exec "Snippet FS \\FSPACE ".bt
exec "Snippet WN \\WINDOW ".bt

