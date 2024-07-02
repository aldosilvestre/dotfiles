--> [URL Mappings](https://github.com/mg979/vim-visual-multi/wiki/Mappings)
local cmd = vim.cmd

cmd('let g:VM_maps = {}')
cmd('let g:VM_default_mappings = 0')
cmd('let g:VM_maps["Add Cursor Down"]="<C-A-j>"')
cmd('let g:VM_maps["Add Cursor Up"]="<C-A-k>"')

return {
  "mg979/vim-visual-multi",
  event = "VeryLazy"
} --> multiple cursor
