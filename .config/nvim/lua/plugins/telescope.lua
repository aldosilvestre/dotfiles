return {
  "nvim-telescope/telescope.nvim", --> Find, Filter, Preview, Pick. All lua, all the time.
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("telescope").load_extension "ui-select"
    require("telescope").load_extension "harpoon"
    require("telescope").load_extension "projects"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "undo"

    require('telescope').setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
      extensions = {
        file_browser = {
          hidden = { file_browser = true, folder_browser = true },
          hijack_netrw = true,
        }
      }
    })
  end
}
