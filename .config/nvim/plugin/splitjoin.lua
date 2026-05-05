-- vim.pack.add(
--   { 'https://github.com/bennypowers/splitjoin.nvim' }
-- )
--
-- vim.keymap.set('n', 'gs', function() require 'splitjoin'.toggle() end)

vim.pack.add({ 'https://github.com/Wansmer/treesj' })

require('treesj').setup{
  use_default_keymaps = true,
}

vim.keymap.set('n', 'gs', require('treesj').toggle)
