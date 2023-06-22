local keymap = vim.keymap.set

return {
  'Exafunction/codeium.vim',
  cmd = "RunCodeium",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "python", "go", "vue" },
  config = function()
    vim.g.codeium_disable_bindings = 1
    keymap('i', '<C-Space>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    keymap('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    keymap('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    keymap('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

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
}
