return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { "<Leader><Leader>i", "<cmd>Nerdy<cr>", mode = "n", desc = "IconPicker NerdFont" },
    { "<C-o>",             "<cmd>Nerdy<cr>", mode = "i", desc = "IconPicker NerdFont Insert mode" },
  }
}
