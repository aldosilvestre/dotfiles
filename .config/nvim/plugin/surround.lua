vim.pack.add({
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/NStefan002/visual-surround.nvim'
}, { load = true })

require('nvim-surround').setup()
require("visual-surround").setup()
