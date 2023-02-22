return {
  'ziontee113/color-picker.nvim', --> color picker
  keys = {
    { mode = "n", "<C-c>", "<cmd>PickColor<cr>", desc = 'color picker' },
    { mode = "i", "<C-c>", "<cmd>PickColor<cr>", desc = 'color picker' }
  },
  config = function()
    require("color-picker").setup({
      ["icons"] = { "ﱢ", "" },
      ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
      ["keymap"] = {
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
      },
      ["background_highlight_group"] = "Normal", -- default
      ["border_highlight_group"] = "FloatBorder", -- default
      ["text_highlight_group"] = "Normal", --default
    })
  end
}
