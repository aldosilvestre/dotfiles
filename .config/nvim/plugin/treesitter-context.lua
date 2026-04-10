local tsc_loaded = false

local function load_treesitter_context()
  if tsc_loaded then return end

  vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" }
  })

  require("treesitter-context").setup({
    mode = "cursor",
    max_lines = 3,
  })

  tsc_loaded = true
end

vim.api.nvim_create_autocmd(
  { "BufReadPost", "BufNewFile", "BufWritePre" },
  {
    callback = function()
      load_treesitter_context()
    end,
  }
)

vim.keymap.set("n", "<leader>ut", function()
  load_treesitter_context()
  require("treesitter-context").toggle()
end, { desc = "Toggle Treesitter Context" })

