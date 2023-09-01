<div align="center">

# Regedit
###### Access your and edit your registers quickly

![demo](demo)

</div>

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jmattaa/regedit.vim'
```

## Neovim

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use('jmattaa/regedit.vim')

```

Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
--- in init.lua:
    {
        'jmattaa/regedit.vim'
    }

--- in plugins/regedit.lua:
return {
    'jmattaa/regedit.vim'
}
```

# Usage

Use quickmark by typing `:Regedit open<cr>` this will open a 
buffer with all of your editable registers 

To edit a specific register you can skip listing all the registers and searching through
by typing `:Regedit <register>` for example `:Regedit "` to edit the `"` register and 
`Regedit c` to edit the c register

For more run the `:help regedit.usage` command

# Default Mappings

### Keystrokes in quickmarks window

The default keys you can use to navigate and handle the quickmaps window 

| Key              | Action                                               |
|------------------|------------------------------------------------------|
| q                | Close the buffer list                                |
| j                | Move the cursor one line down                        |
| k                | Move the cursor one line up                          |
| Enter            | Edit the selected register                           |
| /`<searchterm>`  | To search for a specific `searchterm`                |

# Help
For more help you can find the full documentation in the `regedit` docs by running `:help regedit`

# Authors

- [@jmattaa](https://github.com/jmattaa)

