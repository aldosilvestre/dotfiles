vim.pack.add({
  'https://github.com/lewis6991/impatient.nvim', --> Quickly load
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  { src = 'https://github.com/nvim-tree/nvim-web-devicons', load = true }, --> glyph icons
  'https://github.com/christoomey/vim-tmux-navigator',                     --> tmux navigation
  'https://github.com/onsails/lspkind.nvim',                               --> icons
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/windwp/nvim-autopairs',                              --> autopairs
  'https://github.com/folke/todo-comments.nvim',                           --> TODO coments show
  'https://github.com/smjonas/inc-rename.nvim',                             --> incremental rename
  'https://github.com/neovim/nvim-lspconfig'
})

require('nvim-autopairs').setup()
require('todo-comments').setup()
require('inc_rename').setup {}
