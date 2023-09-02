let s:RegisterBuf = {}
let g:RegeditRegisterBuffer = s:RegisterBuf

function! s:RegisterBuf.Edit(regidx, ...)
    let reg = g:Regedit.Registers[a:regidx]

    let default_val = getreg(reg) 
    let newval = input('edit reg "' . reg . ': ', default_val)
    let newval = '"' . newval . '"'

    " user pressed esc
    " or left empty
    if newval == '""'
        let newval = input('execute: ')
    endif

    " user pressed escape again
    if newval == ''
        return
    endif

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
        execute 'let @' . reg '=""'
    endfor
    echo "Cleared all registers"
endfunction

