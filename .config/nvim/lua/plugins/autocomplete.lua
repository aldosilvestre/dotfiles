-- local keymap = vim.keymap.set

--[[ return {
  'Exafunction/codeium.vim',
  cmd = "RunCodeium",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "python", "go", "vue" },
  config = function()
    vim.g.codeium_disable_bindings = 1
    keymap('i', '<C-Space>', function() return vim.fn['codeium#Accept']() end, { desc = "Accept autocomplete", expr = true })
    keymap('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { desc = "Change next option" ,expr = true })
    keymap('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { desc = "Change prev option", expr = true })
    keymap('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { desc = "Cancel autocomplete", expr = true })

    vim.g.codeium_filetypes = {
      default = false,
      bash = false,
      lua = false,
      markdown = false,
      typescript = true,
      javascript = true,
      javascriptreact = true,
      vue = true,
      python = true,
      golang = true,
      json = false
    }
  end
} ]]

return {
  "supermaven-inc/supermaven-nvim",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "python", "go", "vue", "lua" },
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-j>",
        clear_suggestion = "<C-;>",
        accept_word = "<C-l>",
      },
      ignore_filetypes = { cpp = true, c = true, json = false },
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false        -- disables built in keymaps for more manual control
    })
  end
}
