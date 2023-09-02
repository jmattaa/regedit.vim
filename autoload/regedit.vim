if exists("g:regedit_loaded_autoload") | finish | endif
let g:regedit_loaded_autoload = 1

" this should be loaded on vim or nvim startup
let g:Regedit = {}

let g:Regedit.MainBufName = "[Regedit]"
let g:Regedit.Registers = ['"', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+']

let g:Regedit.KeyPrefix = '<leader>r'
let g:Regedit.KeyOpen = '-'
let g:Regedit.KeyClear = '!'

function! regedit#loadFiles() abort
    runtime lib/regedit/register.vim
    runtime lib/regedit/buffer.vim
    runtime lib/regedit/mappings.vim
endfunction

