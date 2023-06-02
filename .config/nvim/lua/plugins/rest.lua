return {
  "rest-nvim/rest.nvim",
  ft = "http",
  config = function()
    local keymap = vim.keymap.set
    local addDescription = require('config.utils').addDescription
    local rest = require("rest-nvim")
    rest.setup()
    local buff = tonumber(vim.fn.expand "<abuf>", 10)
    local opts = { silent = true, noremap = true, buffer = buff }
    keymap('n', '<leader>rn', rest.run, addDescription(opts, "Run rest Request"))
    keymap('n', '<leader>rl', rest.last, addDescription(opts, "Run last rest Request"))
    keymap('n', '<leader>rs', function() rest.run(true) end, addDescription(opts, "Show preview as curl"))
  end
}
