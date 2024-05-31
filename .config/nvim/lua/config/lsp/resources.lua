local M = {}

M.source_mapping = {
  luasnip = "Snippet",
  nvim_lsp = "Lsp",
  nvim_lua = "Lua",
  supermaven = "SM",
  path = "Path",
  buffer = "Buffer",
}

M.cmp_sources = {
  { name = "buffer" },
  { name = 'luasnip' },
  { name = 'nvim_lsp' },
  { name = 'nvim_lua' },
  { name = "supermaven" },
  { name = "path" },
}

M.signs = {
  error = " ",
  warn = " ",
  hint = " ",
  info = " "
}

return M
