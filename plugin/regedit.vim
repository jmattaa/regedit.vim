if exists('g:regedit_init') | finish | endif " so we don't init more than once 
" coz that be happening
let g:regedit_init = 1

let s:save_cpo = &cpo " save the users options
set cpo&vim " use the default vim options

" load our files
call regedit#loadFiles()

" Regedit command
command! -nargs=+ -complete=customlist,RegeditComplete Regedit :call RegeditCmd(<f-args>)

function! RegeditComplete(ArgLead, CmdLine, CursorPos)
    " this ain't stuff from me
    " but from the butiful internet
    " ArgLead: command name (string)
    " CmdLine: string to be completed (string)
    " CursorPos: position of cursor (number)

    let candidates = ['open'] 

    " filter the candidates based on the input
    let filtered_candidates = filter(candidates, 'v:val =~# "^" . escape(a:ArgLead, "\\")')

    " return the filtered candidates
    return filtered_candidates
endfunction

function! RegeditCmd(...)
    let regtoopen = -1
    for i in range(len(g:Regedit.Registers))
        if g:Regedit.Registers[i] == a:1
            let regtoopen = i
            break
        endif
    endfor

    if a:1 == "open"
        call g:RegeditBuffer.Open()
    elseif regtoopen != -1 
        call g:RegeditRegisterBuffer.Edit(regtoopen, 1)
    else 
        " i give you completion and you manage to get here
        " wow
        echohl ErrorMsg
        echo 'Quickmark: Unkown register/command'
        echohl None
    endif
endfunction

" set the mappings
call g:RegeditMappings.SetMappings()

let &cpo = s:save_cpo " restore the options
unlet s:save_cpo

