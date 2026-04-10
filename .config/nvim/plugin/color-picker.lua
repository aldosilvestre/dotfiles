vim.pack.add({ 'https://github.com/ziontee113/color-picker.nvim' })

local addDescription = require('config.utils').addDescription
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ 'n', 'i' }, '<C-c>', '<CMD>Legendary commands<CR>', addDescription(opts, 'Show Legendary'))


require("color-picker").setup({
  ["icons"] = { "ﱢ", "" },
  ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
  ["keymap"] = {
    ["U"] = "<Plug>ColorPickerSlider5Decrease",
    ["O"] = "<Plug>ColorPickerSlider5Increase",
  },
  ["background_highlight_group"] = "Normal",  -- default
  ["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal",        --default
})
