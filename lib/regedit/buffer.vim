let s:RegBuf= {}
let g:RegeditBuffer = s:RegBuf

" create buffer with the registers
function! s:RegBuf.Open()
    " buffer
    silent! execute 'edit ' . g:Regedit.MainBufName
    
    setlocal modifiable " we want modify very much buffer
    call self._populateBuf() 
    call self._setMappings()
    call self._setBufOpts() " this must be last so we can do all the modifications before we not modify allowed
    " doge
endfunction

function! s:RegBuf.OpenCurrentRegister()
    let i = line('.') - 1 " we need -1 cuz line start at 1 and array start at 0
    " very math
    call g:RegeditRegisterBuffer.Edit(i)
endfunction

" be careful how u use this cuz we may get error
" close the regedit buffer
function! s:RegBuf.Close()
    " CAUTION: very me code not good be careful
    execute 'bdelete'
endfunction

" set the options for the buffer
function! s:RegBuf._setBufOpts()
    setlocal bufhidden=delete " delete the buffer when leaved
    setlocal buftype=nofile " not a file :>
    setlocal noswapfile " don't create a swapfile (tmp file)
    setlocal nomodifiable " no modify

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
    " clear the buffer
    silent %delete _

    let i = 0
    for reg in g:Regedit.Registers
        let reg_content = g:Regedit.Getreg(reg)
        if !empty(reg_content) 
            call append(i, '"' . reg . ": " . reg_content) 
        else
            call append(i, '"' . reg . ": " . "--- EMPTY ---")
        endif
        let i += 1
    endfor
endfunction

" set my mappings
function! s:RegBuf._setMappings()
    nnoremap <silent> <buffer> q :call g:RegeditBuffer.Close()<CR>

    " open current file
    nnoremap <silent> <buffer> <CR> :call g:RegeditBuffer.OpenCurrentRegister()<CR>
endfunction

