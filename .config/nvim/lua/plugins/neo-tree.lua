return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      enable_diagnostics = false,
      enable_git_status = false,
      filesystem = {
        follow_current_file = {
          enabled = true
        },                                      -- This will find and focus the file in the active buffer every time
        hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
      }
    }
}
