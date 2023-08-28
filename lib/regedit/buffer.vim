let s:RegBuf= {}
let g:RegeditBuffer = s:RegBuf

" create or reopen an already created buffer with the registers
function! s:RegBuf.Open()
    if !g:Regedit.BufferExists()
        " create a new buffer
        silent! execute 'edit ' . g:Regedit.MainBufName
    else
        " reopen the window
        " TODO: Properly close
        silent! execute 'bdelete ' . g:Regedit.MainBufName 
        call self.Open()
    endif

    call self._populateBuf() 
    call self._setBufOpts() " this must be last so we can do all the modifications before we not modify allowed
    " doge
endfunction

" set the options for the buffer
function! s:RegBuf._setBufOpts()
    setlocal bufhidden=delete " delete the buffer when leaved
    setlocal buftype=nofile " not a file :>
    setlocal noswapfile " don't create a swapfile (tmp file)
    setlocal readonly nomodifiable " no modify

    " apperence 
    setlocal foldcolumn=0
    setlocal foldmethod=manual
    setlocal nobuflisted
    setlocal nofoldenable
    setlocal nolist
    setlocal nospell
    setlocal nowrap

    setlocal nonumber
    if v:version >= 703
        setlocal norelativenumber
    endif

    setlocal cursorline
    " place cursor on top
    call cursor(1, 1)

    setlocal filetype=RegeditBuffer
endfunction

" print and populate the buffer with registers
function! s:RegBuf._populateBuf()
    " Clear the buffer
    silent %delete _

    let i = 0
    for reg in g:Regedit.Registers
        let reg_content = getreg(reg)
        if !empty(reg_content)
            call append(i, '"' . reg . ": " . reg_content . "\n") 
        else
            call append(i, '"' . reg . ": " . reg_content . "\n")
        endif
        let i += 1
    endfor
endfunction
