local nerdy_loaded = false

local function load_nerdy()
  if nerdy_loaded then return end

  vim.pack.add({
    { src = "https://github.com/2kabhishek/nerdy.nvim" }
  })

  require("nerdy").setup()
  nerdy_loaded = true
end

-- 🔹 Normal mode
vim.keymap.set("n", "<Leader><Leader>i", function()
  load_nerdy()
  vim.cmd("Nerdy")
end, { desc = "IconPicker NerdFont" })

-- 🔹 Insert mode
vim.keymap.set("i", "<C-o>", function()
  load_nerdy()
  vim.cmd("Nerdy")
end, { desc = "IconPicker NerdFont Insert mode" })
