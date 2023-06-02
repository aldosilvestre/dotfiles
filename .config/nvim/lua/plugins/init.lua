return {
  'lewis6991/impatient.nvim',
  'kyazdani42/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'christoomey/vim-tmux-navigator', --> tmux
  'terryma/vim-multiple-cursors',   --> multiple cursor
  'onsails/lspkind.nvim',
  'SmiteshP/nvim-navic',
  -- 'adelarsq/vim-devicons-emoji', --> Emojis
  {
    'phaazon/hop.nvim',
    opts = { keys = 'etovxqpdygfblzhckisuran' },
    event = 'VeryLazy',
    config = function()
      require('hop').setup()
      vim.api.nvim_command('highlight default HopNextKey guifg=#e66666 guibg=bg guisp=#666666 ctermfg=242')
    end
  },                                                                                    --> EasyMotion hop
  { 'windwp/nvim-ts-autotag',       config = true },
  { 'windwp/nvim-autopairs',        config = true },                                    --> autopairs
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install', ft = 'markdown' }, --> Markdown preview
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  }
}
