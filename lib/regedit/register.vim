let s:RegisterBuf = {}
let g:RegeditRegisterBuffer = s:RegisterBuf

function! s:RegisterBuf.Edit(regidx, ...)
    let reg = g:Regedit.Registers[a:regidx]

    let newval = input('edit reg "' . reg . ': ', '"' . getreg(reg) . '"')
    execute 'let @' . reg . '=' . newval
    
    " update our window
    if !get(a:, 1, 0) 
        call g:RegeditBuffer.Open()
        call cursor(a:regidx + 1, 0) " +1 cuz array index starts at 0 and we start line 1
    end

    redraw
    echo 'Updated register: ' . reg
endfunction

function! s:RegisterBuf.ClearRegs()
    for reg in g:Regedit.Registers
        call setreg(reg, "")
    endfor
    echo "Cleared all registers"
endfunction

