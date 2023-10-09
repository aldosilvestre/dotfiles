return {
  'mfussenegger/nvim-dap', --> Debugger protocol
  keys = {
    { "<F7>", "<CMD>DapToggleBreakpoint<CR>", desc = "Breakpoint toggle" },
    { "<F8>", "<CMD>DapContinue<CR>",         desc = "Launch or resume Debug" },
  },
  config = function()
    vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint' })
    vim.cmd.highlight "DapBreakpoint guifg=#ff0000"
  end
}
