local M = {}

M.source_mapping = {
  Snippets = "Snippet",
  LSP = "Lsp",
  nvim_lua = "Lua",
  -- supermaven = "SM",
  Path = "Path",
  Buffer = "Buffer",
}

M.cmp_sources = {
  { name = "buffer" },
  { name = 'luasnip' },
  { name = 'nvim_lsp' },
  { name = 'nvim_lua' },
  -- { name = "supermaven" },
  { name = "path" },
}

M.signs = {
  error = " ",
  warn = " ",
  hint = " ",
  info = " "
}

return M
