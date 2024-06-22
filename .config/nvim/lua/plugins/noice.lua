return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      enabled = false,
      progress = {
        enabled = false,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30,   -- frequency to update lsp progress message
        view = "mini",
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = false,
        ["config.lsp.signature.enabled"] = false,
      },
      hover = {
        enabled = true
      },
      signature = {
        enabled = true
      }
    },
    presets = {
      bottom_search = false,          -- use a classic bottom cmdline for search
      command_palette = true,         -- position the cmdline and popupmenu together
      long_message_to_split = true,   -- long messages will be sent to a split
      inc_rename = true,             -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,          -- add a border to hover docs and signature help
    },
    views = {
      mini = {
        win_options = {
          winbar = "",
          foldenable = false,
          winblend = 0,
        }
      }
    }
  }
}
