return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup {
      options = {
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = true,                -- Disable setting background
        terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,              -- Non focused panes set to alternative background
        module_default = true,             -- Default enable value for modules
        colorblind = {
          enable = false,                  -- Enable colorblind support
          simulate_only = false,           -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0,                    -- Severity [0,1] for protan (red)
            deutan = 0,                    -- Severity [0,1] for deutan (green)
            tritan = 0,                    -- Severity [0,1] for tritan (blue)
          },
        },
        styles = {
          comments = "italic", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "italic, bold",
          constants = "bold",
          functions = "italic",
          keywords = "italic",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "bold",
        },
        inverse = {
          match_paren = false,
          visual = false,
          search = false,
        }
      },
      groups = {
        all = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          Telescope = { bg = "none" }, -- Non-current windows
          Pmenu = { bg = "none" }, -- Non-current windows
        }
      },
    }
    vim.cmd.colorscheme "terafox"
  end
}
