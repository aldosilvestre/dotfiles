return {
  { 'dmmulroy/tsc.nvim',                           event = "VeryLazy" },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    event = "VeryLazy",
    config = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_file_preferences = function(ft)
            -- Some "ifology" using `ft` of opened file
            return {
              includeInlayParameterNameHints = "all",
              includeCompletionsForModuleExports = true,
              quotePreference = "auto",
            }
          end,
          tsserver_format_options = function(ft)
            -- Some "ifology" using `ft` of opened file
            return {
              allowIncompleteCompletions = false,
              allowRenameOfImportPath = false,
            }
          end
        },
      }
    end,
  },
  { 'mfussenegger/nvim-ts-hint-textobject',        event = "VeryLazy" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy" },
  { "windwp/nvim-ts-autotag",                      event = "VeryLazy" }, --> auto tag close
}
