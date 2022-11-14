---@diagnostic disable: undefined-global
local mason_ok, mason = pcall(require, "mason")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local cmp_ok, cmp = pcall(require, "cmp")
local lspkind = require('lspkind')
local luasnip = require('luasnip')

if not mason_ok then
  vim.notify("Couldn't load mason" .. mason, "error")
  return
end

if not mason_lspconfig_ok then
  vim.notify("Couldn't load mason lspconfig" .. mason_lspconfig, "error")
  return
end

if not lspconfig_ok then
  vim.notify("Couldn't load lspconfig" .. lspconfig, "error")
  return
end

if not cmp_nvim_lsp_ok then
  vim.notify("Couldn't load cmp nvim lsp" .. cmp_nvim_lsp_ok, "error")
  return
end

if not cmp_ok then
  vim.notify("Couldn't load cmp" .. cmp, "error")
  return
end

local source_mapping = {
  buffer = "Buffer",
  nvim_lsp = "Lsp",
  nvim_lua = "Lua",
  cmp_tabnine = "TN",
  path = "Path",
}

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)

  vim.api.nvim_set_keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', {silent = true})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
  function(server)
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = { documentFormatting = true, codeAction = true }
    }
  end
})

cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
      vim_item.menu = source_mapping[entry.source.name]
      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = "buffer" },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = "path" },
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
  },
}

--> LSP A otro archivo
require("luasnip/loaders/from_vscode").lazy_load()
