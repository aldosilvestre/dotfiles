vim.pack.add({ 'https://github.com/Wansmer/treesj' })

vim.keymap.set('n', 'gs', require('treesj').toggle)

require('treesj').setup{
  use_default_keymaps = true,
}
