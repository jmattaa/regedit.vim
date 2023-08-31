let s:RegisterBuf = {}
let g:RegeditRegisterBuffer = s:RegisterBuf

function! s:RegisterBuf.Open(regidx)
    let reg = g:Regedit.Registers[a:regidx]

    let newval = input('edit reg "' . reg . ': ', '"' . getreg(reg) . '"')
    execute 'let @' . reg . '=' . newval
    
    " update our window
    call g:RegeditBuffer.Open()
endfunction

