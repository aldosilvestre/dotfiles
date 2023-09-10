local config = {
  sources = {
    "filesystem",
  },
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  default_source = "filesystem",
  enable_diagnostics = false,
  enable_git_status = false,
  enable_modified_markers = true, -- Show markers for files with unsaved changes.
  enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
  git_status_async = false,
  hide_root_node = false,            -- Hide the root node.
  retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow.
  log_level = "info",                -- "trace", "debug", "info", "warn", "error", "fatal"
  log_to_file = false,               -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
  open_files_in_last_window = true,  -- false = open files in top left window
  popup_border_style = "rounded",    -- "double", "none", "rounded", "shadow", "single" or "solid"
  resize_timer_interval = 500,       -- in ms, needed for containers to redraw right aligned and faded content
  sort_case_insensitive = false,     -- used when sorting files and directories in the tree
  sort_function = nil,               -- uses a custom function for sorting files and directories in the tree
  use_popups_for_input = true,       -- If false, inputs will use vim.ui.input() instead of custom floats.
  use_default_mappings = true,
  source_selector = {
    winbar = false,                        -- toggle to show selector on winbar
    statusline = false,                    -- toggle to show selector on statusline
    show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
    sources = {
      filesystem = "  Files ",
    },
    content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
    tabs_layout = "equal", -- start, end, center, equal, focus
    truncation_character = "…", -- character to use when truncating the tab label
    tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
    tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
    padding = 0, -- can be int or table
    separator = { left = "▏", right = "▕" },
    separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
    show_separator_on_edge = false,
    highlight_tab = "NeoTreeTabInactive",
    highlight_tab_active = "NeoTreeTabActive",
    highlight_background = "NeoTreeTabInactive",
    highlight_separator = "NeoTreeTabSeparatorInactive",
    highlight_separator_active = "NeoTreeTabSeparatorActive",
  },
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+] ",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
  },
  renderers = {
    directory = {
      { "indent" },
      { "icon" },
      { "current_filter" },
      {
        "container",
        width = "100%",
        right_padding = 0,
        content = {
          { "name",        zindex = 10 },
          { "clipboard",   zindex = 10 },
          { "diagnostics", errors_only = true, zindex = 20, align = "right" },
        },
      },
    },
    file = {
      { "indent" },
      { "icon" },
      {
        "container",
        width = "100%",
        right_padding = 0,
        content = {
          {
            "name",
            zindex = 10
          },
          { "clipboard",   zindex = 10 },
          { "bufnr",       zindex = 10 },
          { "modified",    zindex = 20, align = "right" },
          { "diagnostics", zindex = 20, align = "right" },
        },
      },
    },
    message = {
      { "indent", with_markers = true },
      { "name",   highlight = "NeoTreeMessage" },
    },
    terminal = {
      { "indent" },
      { "icon" },
      { "name" },
      { "bufnr" }
    }
  },
  nesting_rules = {},
  window = {
    position = "left", -- left, right, top, bottom, float, current
    border = "rounded",
    popup = {
      size = {
        height = "80%",
        width = "50%",
      },
      position = "50%", -- 50% means center it
    },
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["o"] = "open",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["t"] = "open_tabnew",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["R"] = "refresh",
      ["a"] = {
        "add",
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the config.show_path option.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
      ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
      ["q"] = "close_window",
      ["?"] = "show_help",
    },
  },
  filesystem = {
    window = {
      mappings = {
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["f"] = "filter_on_submit",
        ["<C-x>"] = "clear_filter",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["gp"] = "prev_git_modified",
        ["gn"] = "next_git_modified",
      }
    },
    async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
    bind_to_cwd = true,            -- true creates a 2-way binding between vim's cwd and neo-tree's root
    cwd_target = {
      sidebar = "tab",             -- sidebar is when position = left or right
      current = "window"           -- current is when position = current
    },
    filtered_items = {
      visible = false,                       -- when true, they will just be displayed differently than normal items
      force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
      show_hidden_count = true,              -- when true, the number of hidden items in each folder will be shown as the last entry
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        "node_modules",
      },
      hide_by_pattern = { -- uses glob style patterns
        "*.meta"
      },
      never_show = { -- remains hidden even if visible is toggled to true
        ".DS_Store",
        "thumbs.db"
      },
    },
    find_by_full_path_words = false, -- `false` means it only searches the tail of a path.
    group_empty_dirs = true,         -- when true, empty folders will be grouped together
    search_limit = 50,               -- max number of search results when using filters
    follow_current_file = {
      enabled = true
    },                                      -- This will find and focus the file in the active buffer every time
    hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
    use_libuv_file_watcher = false,         -- This will use the OS level file watchers to detect changes
  }
}

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v3.x",
  event = "VimEnter",
  dependencies = {
    'MunifTanjim/nui.nvim', --> Dependency from neo tree
  },
  config = function()
    require("neo-tree").setup(config)
  end
}
