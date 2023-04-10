return {
  'mfussenegger/nvim-dap', --> Debugger protocol
  keys = {
    { "bp", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",  desc = "Breakpoint toggle" },
    { "<F5>", "<cmd>lua require'dap'.step_into()<cr>",  desc = "Step Into" },
    { "<F6>", "<cmd>lua require'dap'.step_over()<cr>",  desc = "Step Over" },
    { "<F7>", "<cmd>lua require'dap'.continue()<cr>",  desc = "Breakpoint toggle" },
    { "<F8>", "<cmd>lua require'dap'.continue()<cr>",  desc = "Launch or resume Debug" },
  }
}
