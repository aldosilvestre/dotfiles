local kulala_loaded = false

local function load_kulala()
  if kulala_loaded then return end

  vim.pack.add({
    { src = "https://github.com/mistweaverco/kulala.nvim" }
  })

  -- opts = {...}
  require("kulala").setup({
    global_keymaps = false,
  })

  kulala_loaded = true
end

-- 🔹 Lazy por filetype (equivalente a ft = { "http", "rest" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "http", "rest" },
  callback = function()
    load_kulala()
  end,
})

-- 🔹 Keymaps (lazy)
vim.keymap.set("n", "<leader>rs", function()
  load_kulala()
  require("kulala").run()
end, { desc = "Send request" })

vim.keymap.set("n", "<leader>ra", function()
  load_kulala()
  require("kulala").run_all()
end, { desc = "Send all requests" })

vim.keymap.set("n", "<leader>rb", function()
  load_kulala()
  require("kulala").scratchpad()
end, { desc = "Open scratchpad" })
