return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "Night",
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        comments = "italic",
        keywords = "italic",
        functions = "NONE",
        variables = "NONE",
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      sidebars = { "qf", "vista_kind", "terminal", "packer", "Lazy", "Mason" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      on_colors = function(colors)
        colors.border = "#1A1B26"
      end,

      on_highlights = function(hl, c)
        local prompt = "#FFA630"
        local text = "#488dff"
        local none = "NONE"

        hl.TelescopeTitle = {
          fg = prompt,
        }
        hl.TelescopeNormal = {
          bg = none,
          fg = none,
        }
        hl.TelescopeBorder = {
          bg = none,
          fg = text
        }
        hl.TelescopeMatching = {
          fg = prompt
        }
        hl.MsgArea = {
          fg = c.fg_dark
        }
      end,
    })
    vim.cmd.colorscheme("tokyonight")
  end
}
