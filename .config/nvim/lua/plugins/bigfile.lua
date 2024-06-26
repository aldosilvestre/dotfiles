return {
  "LunarVim/bigfile.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- default config
    require("bigfile").config {
      filesize = 1,  -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern
      features = {   -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        -- "vimopts",
        -- "filetype",
      },
    }
  end
}
