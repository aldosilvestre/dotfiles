local addDescription = require('config.utils').addDescription
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

return {
  -- { "kdheepak/lazygit.nvim", event = "VeryLazy" }, --> Manager Git
  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff"

  },
  -- {
  --   "sindrets/diffview.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     -- highlight('DiffAdd',    colbg, "#72f1b8")
  --     -- highlight('DiffChange', colbg, "#ff8b39")
  --     -- highlight('DiffDelete', colbg, "#fe4450")
  --     -- highlight('DiffText',   colbg, "#ff8b39")
  --   end
  -- },
  {
    "FabijanZulj/blame.nvim",
    event  = "VeryLazy",
    config = function()
      require("blame").setup()

      map('n', 'gb', '<CMD>BlameToggle<CR>', addDescription(opts, "Toggle git blame"))
    end
  } --> Blame
}
