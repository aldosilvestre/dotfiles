vim.pack.add({ 'https://github.com/chrisgrieser/nvim-origami' }, { load = true })

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup()
