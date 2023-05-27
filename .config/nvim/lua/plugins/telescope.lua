return {
  "nvim-telescope/telescope.nvim", --> Find, Filter, Preview, Pick. All lua, all the time.
  dependencies = {
		"nvim-lua/popup.nvim",
		"kyazdani42/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function ()
    require("telescope").load_extension "ui-select"
  end
}
