let s:RegMappings = {}
let g:RegeditMappings = s:RegMappings

function! s:RegMappings.SetMappings()
    execute 'nnoremap ' . g:Regedit.KeyPrefix . g:Regedit.KeyOpen . ' :Regedit open<CR>'
    execute 'nnoremap '. g:Regedit.KeyPrefix . g:Regedit.KeyClear . ' :Regedit clear<CR>'

    for reg in g:Regedit.Registers
        execute 'nnoremap ' . g:Regedit.KeyPrefix . reg . ' :Regedit ' . reg . '<CR>'
    endfor
endfunction

function! s:RegMappings.UnsetMappings()
    silent! execute 'unmap ' . g:Regedit.KeyPrefix . g:Regedit.KeyOpen 
    silent! execute 'unmap'. g:Regedit.KeyPrefix . g:Regedit.KeyClear 

    for reg in g:Regedit.Registers
        silent! execute 'unmap ' . g:Regedit.KeyPrefix . reg 
    endfor   
endfunction

