local loaded = false

local load_picker = function()
  if loaded then return end

  loaded = true
  vim.pack.add({ 'https://github.com/ziontee113/color-picker.nvim' })

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
end

vim.keymap.set({ "i", "n" }, "<C-c>", function()
  load_picker()
  vim.cmd("PickColor")
end, { noremap = true, silent = true, desc = "Color Picker" })
