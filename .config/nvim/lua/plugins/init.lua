return {
  "lewis6991/impatient.nvim",       --> Quickly load
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",   --> glyph icons
  "christoomey/vim-tmux-navigator", --> tmux
  "onsails/lspkind.nvim",           --> icons
  -- 'adelarsq/vim-devicons-emoji', --> Emojis
  { "stevearc/dressing.nvim", event = "VeryLazy", config = true },
  { "mg979/vim-visual-multi", event = "VeryLazy" },                                                                                    --> multiple cursor
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    opts = { keys = "fjdksla;ghrueiwoqptybnvmc" },
    config = true
  },                                                                                                                                   --> EasyMotion hop
  { "windwp/nvim-ts-autotag",       config = true },                                                                                   --> auto tag close
  { "windwp/nvim-autopairs",        config = true },                                                                                   --> autopairs
  { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown" },                                                --> Markdown preview
  { "folke/todo-comments.nvim",     event = "VeryLazy",              config = true },                                                  --> TODO coments show
}
