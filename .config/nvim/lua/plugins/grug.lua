return {
  "MagicDuck/grug-far.nvim",
  example = "GrugFar",
  keys = {
    { "<leader><leader>s", "<CMD>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<CR>", desc = "Open Grug" }
  },
  config = function()
    vim.g.maplocalleader = ','

    require("grug-far").setup({
      windowCreationCommand = "botright vsplit %",
    })
  end,
}
