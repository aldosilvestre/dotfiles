return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VimEnter",
  opts = {
    enable_diagnostics = false,
    enable_git_status = false,
    use_default_mappings = false,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true
      },                                      -- This will find and focus the file in the active buffer every time
      hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
      window = {
        mappings = {
          ["H"] = "toggle_hidden",
          ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["<space>"] = {
            "toggle_node",
            nowait = false,   -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel", -- close preview or floating neo-tree window
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["a"] = { "add",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            }
          },
          ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["q"] = "close_window",
          ["?"] = "show_help",
        }
      }
    }
  }
}
