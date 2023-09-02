let s:RegMappings = {}
let g:RegeditMappings = s:RegMappings

function! s:RegMappings.SetMappings()
    execute 'nnoremap ' . g:Regedit.KeyPrefix . g:Regedit.KeyOpen . ' :Regedit open<CR>'

    for reg in g:Regedit.Registers
        execute 'nnoremap ' . g:Regedit.KeyPrefix . reg . ' :Regedit ' . reg . '<CR>'
    endfor
endfunction
