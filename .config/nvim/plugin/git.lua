local addDescription = require('config.utils').addDescription
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.pack.add({
  'https://github.com/esmuellert/vscode-diff.nvim',
  'https://github.com/FabijanZulj/blame.nvim'
})

vim.pack.add({ 'https://github.com/FabijanZulj/blame.nvim' })

map('n', 'gb', '<CMD>BlameToggle<CR>', addDescription(opts, "Toggle git blame"))
require("blame").setup()
