return {
  "junegunn/vim-easy-align",
  event = "VeryLazy",
  keys = {
    { "ga",         "<Plug>(EasyAlign)", mode = "v", desc = "EasyAlign" },
    { "<Leader>ga", "<Plug>(EasyAlign)", mode = "n", desc = "EasyAlign" }
  },
}
