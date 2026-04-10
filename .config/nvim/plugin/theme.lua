local highlight = require("config.utils").highlight
local colbg = "transparent"

vim.pack.add( {'https://github.com/maxmx03/fluoromachine.nvim'} , { load = true })

require('fluoromachine').setup{ glow = false, theme = 'fluoromachine', transparent = 'true' }

vim.cmd.colorscheme 'fluoromachine'
vim.cmd.highlight 'CursorLine gui=bold,italic' --> cursorline transparent

highlight('DiffAdd',    "#72f1b8",colbg )
highlight('DiffChange', "#ff8b39",colbg )
highlight('DiffDelete', "#fe4450",colbg )
highlight('DiffText',   "#ff8b39",colbg )

