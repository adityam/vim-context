if !exists('loaded_snippet') || &cp
    finish
endif

let s:st = g:snip_start_tag
let s:et = g:snip_end_tag
let s:bt = s:st.s:et
let s:si = IMAP_GetPlaceHolderStart()
let s:ei = IMAP_GetPlaceHolderEnd()

function! s:install_snippet(trigger, start, stop)
  exec "Snippet " . a:trigger . " " . a:start . "<CR>" . s:bt . "<CR>" . a:stop
endfunction

" Start stops
function! s:define_startstop(trigger, name)
  call s:install_snippet(a:trigger, "\\start".a:name, "\\stop".a:name)
endfunction

call s:define_startstop("item", "itemize")
call s:define_startstop("text", "text")
call s:define_startstop("page", "TEXpage")

" Heads
function! s:define_head(trigger, section)
  call s:install_snippet(a:trigger, 
        \   "\\start".a:section."[title={".s:st."title".s:et."}".s:bt."]", "\\stop".a:section)
endfunction

call s:define_head("sec",  "section")
call s:define_head("sec2", "subsection")
call s:define_head("sec3", "subsubsection")

call s:define_head("sub",  "subject")
call s:define_head("sub2", "subsubject")
call s:define_head("sub3", "subsubsubject")


" Floats
function! s:define_float(float)
  call s:install_snippet(a:float,
        \   "\\startplace".a:float."[location=".s:bt.", title={".s:bt."}".s:bt."]", "\\stopplace".a:float)
endfunction

call s:define_float("figure")
call s:define_float("table")

" Environments, components, etc.
function! s:define_environment(env)
  let l:filename = expand("%:t:r")
  call s:install_snippet(a:env, "\\start".a:env." ".l:filename, "\\stop".a:env)
endfunction

call s:define_environment("environment")
call s:define_environment("component")
call s:define_environment("product")

" Math
exec "Snippet for \\startformula<CR>".s:bt."<CR>\\stopformula".s:si.s:ei
exec "Snippet pfor \\placeformula[".s:st."tag".s:et."] \\startformula<CR>".s:bt."<CR>\\stopformula".s:si.s:ei

exec "Snippet fora \\startformula \\startalign<CR>".s:bt."<CR>\\stopalign \\stopformula".s:si.s:ei
exec "Snippet pfora \\placeformula[".s:st."tag".s:et."] \\startformula \\startalign<CR>".s:bt."<CR>\\stopalign \\stopformula".s:si.s:ei


" For specific project
exec "Snippet FL \\FIELD ".s:bt
exec "Snippet AL \\ALPHABET ".s:bt
exec "Snippet FS \\FSPACE ".s:bt
exec "Snippet WN \\WINDOW ".s:bt

