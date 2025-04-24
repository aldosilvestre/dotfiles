local picker_opts = {
  enabled = true,
  sources = {
    explorer = {
      hidden = true,
      expanded = true,
      follow_file = true,
      -- auto_close = true,
      jump = { close = true },

      layout = {
        layout = {
          position = "right"
        },
      }
    },
  },
}

local explorer_opts = {
  enabled = true,
  replace_netrw = true,
}


local input_opts = {
  enabled = true,
  backdrop = true,
  position = "top",
  border = "rounded",
  title_pos = "center",
  height = 1,
  width = 60,
  relative = "editor",
  noautocmd = true,
  row = 2,
  -- relative = "cursor",
  -- row = -3,
  -- col = 0,
  wo = {
    winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
    cursorline = false,
  },
  bo = {
    filetype = "snacks_input",
    buftype = "prompt",
  },
  --- buffer local variables
  b = {
    completion = false, -- disable blink completions in input
  },
  keys = {
    n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
    i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
    i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
    i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
    i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
    i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
    i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
    q = "cancel",
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "gl", function() require('snacks').lazygit.log_file() end, desc = "Open log current file" },
  },
  opts = {
    bigfile = { enabled = true },
    explorer = explorer_opts,
    indent = { enabled = true },
    input = input_opts,
    picker = picker_opts,
    notifier = {
      enabled = true,
      stages = "fade",
      top_down = false
    },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
