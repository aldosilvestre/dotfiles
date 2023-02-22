return {
  'AndrewRadev/splitjoin.vim', --> switching between a single-line statement and a multi-line one
  event = "VeryLazy",
  keys = {
    { "gj", "<cmd>SplitjoinJoin<cr>",  desc = "Join" },
    { "gk", "<cmd>SplitjoinSplit<cr>", desc = "Split" },
  },
  config = function(_, _)
    vim.cmd([[
                let g:splitjoin_split_mapping = ""
                let g:splitjoin_join_mapping = ""
                let g:splitjoin_quiet = 1
            ]])
  end,
}
