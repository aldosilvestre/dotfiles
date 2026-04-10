local options = {
  clipboard      = "unnamed,unnamedplus",   --- Copy-paste between vim and everything else
  cmdheight      = 0,                       --- Give more space for displaying messages
  completeopt    = "menu,menuone,noselect", --- Better autocompletion
  cursorline     = true,                    --- Highlight of current line
  emoji          = true,                    --- Fix emoji display
  expandtab      = true,                    --- Use spaces instead of tabs
  -- foldlevelstart = 99,                      --- Expand all folds by default
  -- foldtext       = "CustomFold()",          --- Emit custom function for foldtext
  foldenable     = false,
  ignorecase     = true,                    --- Needed for smartcase
  lazyredraw     = false,                   --- Makes macros faster & prevent errors in complicated mappings
  mouse          = "a",                     --- Enable mouse
  statuscolumn   = '%s%3(%=%{v:lnum}%)│%2(%=%{v:relnum==0 ? "" : v:relnum }%#SpecialKey#%{v:relnum==0? "":""}%) ',
  number         = true,                    --- Shows current line number
  relativenumber = true,                    --- Enables relative number
  scrolloff      = 8,                       --- Always keep space when scrolling to bottom/top edge
  shiftwidth     = 2,                       --- Change a number of space characeters inseted for indentation
  showtabline    = 2,                       --- Always show tabs
  signcolumn     = "yes",                   --- Add extra sign column next to line number
  smartcase      = true,                    --- Uses case in search
  smartindent    = true,                    --- Makes indenting smart
  smarttab       = true,                    --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2,                       --- Insert 2 spaces for a tab
  splitright     = true,                    --- Vertical splits will automatically be to the right
  swapfile       = false,                   --- Swap not needed
  tabstop        = 2,                       --- Insert 2 spaces for a tab
  termguicolors  = true,                    --- Correct terminal colors
  timeoutlen     = 300,                     --- Faster completion
  undofile       = true,                    --- Sets undo to file
  updatetime     = 100,                     --- Faster completion
  viminfo        = "'1000",                 --- Increase the size of file history
  wildignore     = "*node_modules/**",      --- Don't search inside Node.js modules (works for gutentag)
  wrap           = false,                   --- Display long lines as just one line
  writebackup    = false,                   --- Not needed
  pumblend       = 0,                       --- Popup blend

  -- Neovim defaults
  autoindent     = true,               --- Good auto             indent
  backspace      = "indent,eol,start", --- Making sure backspace works
  backup         = false,              --- Recommended by coc
  conceallevel   = 0,                  --- Show `` in markdown files
  encoding       = "utf-8",            --- The encoding displayed
  errorbells     = false,              --- Disables sound effect for errors
  fileencoding   = "utf-8",            --- The encoding written to file
  incsearch      = true,               --- Start searching before pressing enter
  showmode       = false,              --- Don't show things like -- INSERT -- anymore
  -- guicursor      = "i:ver25,n-v-c:hor20", --- Gui cursor
  guicursor      = {
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
  },                                    --- Gui cursor
  smoothscroll   = true,
  ruler          = false
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Settings globals
local globals = {
  mapleader = ' ', --> leader blankspace
  maplocalleader = ' ',
  loaded_perl_provider = false,
  loaded_python3_provider = 0,
  deprecation_warnings = false,
  trouble_lualine = true
}

for k, v in pairs(globals) do
  vim.g[k] = v
end


-- Plugins to disable
local disabled_builtin_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

-- Prevenir la carga automática
for _, plugin in ipairs(disabled_builtin_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Autocmd commands
vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]] --> remove spaces from the end of line
