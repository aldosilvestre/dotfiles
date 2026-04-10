local hop_loaded = false

local function load_hop()
  if hop_loaded then return end
  vim.pack.add({ "https://github.com/smoka7/hop.nvim" })

  require("hop").setup({
    keys = "fjdksla;ghrueiwoqptybnvmc"
  })

  hop_loaded = true
end

local function hop_cmd()
  load_hop()
  vim.cmd("HopPattern")
end

vim.keymap.set({ "n", "o", "x" }, "<C-s>", hop_cmd, { desc = "Hop" })
