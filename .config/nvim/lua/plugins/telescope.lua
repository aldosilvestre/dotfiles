return {
  "nvim-telescope/telescope.nvim", --> Find, Filter, Preview, Pick. All lua, all the time.
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function ()
    require("telescope").load_extension "ui-select"
  end
}
