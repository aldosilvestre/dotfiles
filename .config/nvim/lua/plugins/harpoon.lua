local addDescription = require('config.utils').addDescription

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Harpoon
    map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    map('n', '<leader>ht', function() harpoon:list():add()  end, addDescription(opts, 'Toggle mark harpoon'))
  end
}
