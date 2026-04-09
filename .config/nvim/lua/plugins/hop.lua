return {
  'smoka7/hop.nvim',
  version = "*",
  keys = {
    { "<c-s>", mode = { "n", "o", "x" }, "<CMD>HopPattern<CR>", desc = "Hop" }
  },
  config = function()
    local plugin = require("hop")
    plugin.setup({ keys = "fjdksla;ghrueiwoqptybnvmc" })
  end
}
