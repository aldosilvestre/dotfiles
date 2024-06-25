return {
  "lewis6991/impatient.nvim", --> Quickly load
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons",    --> glyph icons
  "christoomey/vim-tmux-navigator", --> tmux
  "onsails/lspkind.nvim",           --> icons
  -- 'adelarsq/vim-devicons-emoji', --> Emojis
  { "stevearc/dressing.nvim", event = "VeryLazy",    config = true },
  { 'windwp/nvim-autopairs',  event = "InsertEnter", opts = {} }, --> autopairs
  {
    "iamcco/markdown-preview.nvim",                               --> markdown preview
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "folke/todo-comments.nvim", event = "VeryLazy", config = true },                                         --> TODO coments show
  -- { 'echasnovski/mini.animate',     event = "VeryLazy",              version = '*', config = true } --> animations
  { "smjonas/inc-rename.nvim",  event = "VeryLazy", config = function() require("inc_rename").setup() end }, --> incremental rename
}
