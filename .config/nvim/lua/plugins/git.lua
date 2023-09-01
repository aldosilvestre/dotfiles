local highlight = require("config.utils").highlight
local colbg = "#1c082d"


return {
  { "kdheepak/lazygit.nvim", event = "VeryLazy" }, --> Manager Git
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      highlight('DiffAdd', colbg, "#72f1b8")
      highlight('DiffChange', colbg, "#ff8b39")
      highlight('DiffDelete', colbg, "#fe4450")
      highlight('DiffText', colbg, "#ff8b39")
    end
  }
}
