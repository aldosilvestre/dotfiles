local keymap = vim.keymap.set

return {
  'Exafunction/codeium.vim',
  cmd = "RunCodeium",
  ft = { "javascript", "typescript", "python", "go"},
  config = function()
    vim.g.codeium_disable_bindings = 1
    -- Change '<C-g>' here to any keycode you like.
    keymap('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    keymap('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    keymap('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    keymap('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

    vim.g.codeium_filetypes = {
      default = false,
      bash = false,
      lua = false,
      markdown = false,
      typescript = true,
      python = true,
      golang = true,
      json = false
    }
  end
}
