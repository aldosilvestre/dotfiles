return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    lsp = {
        auto_attach = true, -- If set to true, you don't need to manually use attach function
        preference = nil     -- list of lsp server names in order of preference
      }
  },
  config = true,
  lazy = false
}
