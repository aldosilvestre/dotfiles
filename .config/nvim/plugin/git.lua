vim.pack.add({
  'https://www.github.com/lewis6991/gitsigns.nvim',
  'https://github.com/esmuellert/vscode-diff.nvim',
  'https://github.com/FabijanZulj/blame.nvim'
})

require("blame").setup()
require("codediff").setup()
require("gitsigns").setup()
