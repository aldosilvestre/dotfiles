local addDescription = require('config.utils').addDescription
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

require("grug-far").setup({
  windowCreationCommand = "botright vsplit %",
})

map('n', '<leader><leader>s',
  function() require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } }) end,
  addDescription(opts, 'Open Grug'))
