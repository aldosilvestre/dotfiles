return {
  "lewis6991/impatient.nvim", --> Quickly load
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons",    --> glyph icons
  "christoomey/vim-tmux-navigator", --> tmux
  "onsails/lspkind.nvim",           --> icons
  -- 'adelarsq/vim-devicons-emoji', --> Emojis
  { "stevearc/dressing.nvim",   event = "VeryLazy",    config = true },
  { 'windwp/nvim-autopairs',    event = "InsertEnter", opts = {} },                                             --> autopairs
  { "folke/todo-comments.nvim", event = "VeryLazy",    config = true },                                         --> TODO coments show
  { "smjonas/inc-rename.nvim",  event = "VeryLazy",    config = function() require("inc_rename").setup() end }, --> incremental rename
  { "Aasim-A/scrollEOF.nvim",   event = "CursorMoved", config = true }                                          --> fixes scrolloff at end of file
}
