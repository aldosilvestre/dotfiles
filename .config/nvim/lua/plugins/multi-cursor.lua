--> [URL Mappings](https://github.com/mg979/vim-visual-multi/wiki/Mappings)

vim.cmd('let g:VM_maps = {}')
vim.cmd('let g:VM_default_mappings = 0')

vim.cmd('let g:VM_maps["Add Cursor Down"]="<C-j>"')
vim.cmd('let g:VM_maps["Add Cursor Up"]="<C-k>"')

return {
  "mg979/vim-visual-multi",
  event = "VeryLazy"
} --> multiple cursor
