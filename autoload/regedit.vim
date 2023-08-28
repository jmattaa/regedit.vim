if exists("g:regedit_loaded_autoload") | finish | endif
let g:regedit_loaded_autoload = 1

function! regedit#loadFiles() abort
    runtime lib/regedit/regedit.vim
    runtime lib/regedit/buffer.vim
    runtime lib/regedit/save.vim
endfunction

