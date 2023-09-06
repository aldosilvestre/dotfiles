return {
  "nvim-telescope/telescope.nvim", --> Find, Filter, Preview, Pick. All lua, all the time.
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("telescope").load_extension "ui-select"
    require("telescope").load_extension "harpoon"
    require("telescope").load_extension "projects"
  end
}
