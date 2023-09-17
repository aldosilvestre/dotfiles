local highlight = require("config.utils").highlight

-- }}}2

-- Settings {{{2
local lineLengthWarning = 50
local lineLengthError = 50
local leftbracket = ""
local rightbracket = ""

local colors = {
  bg              = 'transparent',
  modetext        = '#000000',
  giticon         = '#FF8800',
  gitbg           = '#5C2C2E',
  gittext         = '#C5C5C5',
  gpsicon         = '#000000',
  gpsbg           = '#5C00A3',
  gpstext         = '#C5C5C5',
  diagerror       = '#F44747',
  diagwarn        = '#FF8800',
  diaghint        = '#4FC1FF',
  diaginfo        = '#FFCC66',
  lspicon         = '#68AF00',
  lspbg           = '#304B2E',
  lsptext         = '#C5C5C5',
  typeicon        = '#FF8800',
  typebg          = '#5C2C2E',
  typetext        = '#C5C5C5',
  statsicon       = '#9CDCFE',
  statsbg         = '#5080A0',
  statstext       = '#000000',
  lineokfg        = '#000000',
  lineokbg        = '#5080A0',
  linelongerrorfg = '#FF0000',
  linelongwarnfg  = '#FFFF00',
  linelongbg      = '#5080A0',
  shortbg         = '#DCDCAA',
  shorttext       = '#000000',
  shortrightbg    = '#3F3F3F',
  shortrighttext  = '#7C4C4E',
  red             = '#fe4450',
  yellow          = '#FFCC00',
  magenta         = '#FC199A',
  green           = '#72f1b8',
  orange          = '#ff8b39',
  purple          = '#AF6DF9',
  blue            = '#569CD6',
  cyan            = '#61E2FF',
  white           = '#FFFFFF'
}

local mode_map = {
  ['n']        = { '#569CD6', 'NORMAL' },
  ['i']        = { '#D16969', 'INSERT' },
  ['R']        = { '#D16969', 'REPLACE' },
  ['c']        = { '#608B4E', 'COMMAND' },
  ['v']        = { '#C586C0', 'VISUAL' },
  ['V']        = { '#C586C0', 'VIS-LN' },
  ['']        = { '#C586C0', 'VIS-BLK' },
  ['s']        = { '#FF8800', 'SELECT' },
  ['S']        = { '#FF8800', 'SEL-LN' },
  ['']        = { '#DCDCAA', 'SEL-BLK' },
  ['t']        = { '#569CD6', 'TERMINAL' },
  ['Rv']       = { '#D16D69', 'VIR-REP' },
  ['rm']       = { '#FF0000', '- More -' },
  ['r']        = { '#FF0000', "- Hit-Enter -" },
  ['r?']       = { '#FF0000', "- Confirm -" },
  ['cv']       = { '#569CD6', "Vim Ex Mode" },
  ['ce']       = { '#569CD6', "Normal Ex Mode" },
  ['!']        = { '#569CD6', "Shell Running" },
  ['ic']       = { '#DCDCAA', 'Insert mode completion |compl-generic|' },
  ['no']       = { '#DCDCAA', 'Operator-pending' },
  ['nov']      = { '#DCDCAA', 'Operator-pending (forced charwise |o_v|)' },
  ['noV']      = { '#DCDCAA', 'Operator-pending (forced linewise |o_V|)' },
  ['noCTRL-V'] = { '#DCDCAA', 'Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character' },
  ['niI']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Insert-mode|' },
  ['niR']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Replace-mode|' },
  ['niV']      = { '#DCDCAA', 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|' },
  ['ix']       = { '#DCDCAA', 'Insert mode |i_CTRL-X| completion' },
  ['Rc']       = { '#DCDCAA', 'Replace mode completion |compl-generic|' },
  ['Rx']       = { '#DCDCAA', 'Replace mode |i_CTRL-X| completion' },
}

-- See: https://www.nerdfonts.com/cheat-sheet
local icons = {
  vim = ' ',
  dos = ' ',
  unix = ' ',
  mac = ' ',
}
-- }}}2

-- Rag status function {{{2
local function setLineWidthColours()
  local colbg = colors.statsbg
  local colfg = colors.white
  local linebg = colors.statsbg

  if (vim.fn.col('.') > lineLengthError)
  then
    colbg = colors.linelongerrorfg
  elseif (vim.fn.col('.') > lineLengthWarning)
  then
    colbg = colors.linelongwarnfg
  end

  if (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthError)
  then
    linebg = colors.linelongerrorfg
  elseif (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthWarning)
  then
    linebg = colors.linelongwarnfg
  end

  highlight('LinePosHighlightStart', colbg, colors.statsbg)
  highlight('LinePosHighlightColNum', colors.white, colbg)
  highlight('LinePosHighlightMid', linebg, colbg)
  highlight('LineLenHighlightLenNum', colfg, linebg)
  highlight('LinePosHighlightEnd', linebg, colors.statsbg)
end

return {
  "glepnir/galaxyline.nvim",
  config = function()
    local gl = require('galaxyline')
    local condition = require('galaxyline.condition')

    gl.short_line_list = { 'neo-tree', 'vista', 'dbui', 'packer', 'tagbar', '*' }
    local gls = gl.section


    -- Left {{{1
    gls.left = {}

    table.insert(gls.left, {
      MacroRecording = {
        provider = function()
          if vim.fn.reg_recording() == '' then
            return ""
          else
            return ' '
          end
        end,
        condition = condition.hide_in_width,
        highlight = { colors.red, colors.bg },
      }
    })

    -- Edit mode {{{2
    table.insert(gls.left, {
      ViModeSpaceOnFarLeft = {
        provider = function() return " " end,
        highlight = { colors.giticon, colors.bg }
      }
    })
    table.insert(gls.left, {
      ViModeLeft = {
        provider = function()
          highlight('ViModeHighlight', mode_map[vim.fn.mode()][1], colors.bg)
          return leftbracket
        end,
        highlight = 'ViModeHighlight'
      }
    })
    table.insert(gls.left, {
      ViModeIconAndText = {
        provider = function()
          highlight('GalaxyViMode', colors.modetext, mode_map[vim.fn.mode()][1])
          return icons['vim'] .. " " .. mode_map[vim.fn.mode()][2] .. " "
        end,
        highlight = 'GalaxyViMode'
      }
    })
    table.insert(gls.left, {
      ViModeRight = {
        provider = function()
          return rightbracket
        end,
        separator = ' ',
        separator_highlight = 'ViModeHighlight',
        highlight = 'ViModeHighlight'
      }
    })
    -- }}}2

    -- Git info {{{2

    -- Git Branch Name {{{3
    table.insert(gls.left, {
      GitStart = {
        provider = function() return leftbracket end,
        condition = condition.check_git_workspace,
        highlight = { colors.giticon, colors.bg }
      }
    })
    table.insert(gls.left, {
      GitIcon = {
        provider = function()
          return ' '
        end,
        condition = condition.check_git_workspace,
        separator = '',
        separator_highlight = { 'NONE', colors.giticon },
        highlight = { colors.gitbg, colors.giticon }
      }
    })
    table.insert(gls.left, {
      GitMid = {
        provider = function() return rightbracket .. ' ' end,
        condition = condition.check_git_workspace,
        highlight = { colors.giticon, colors.gitbg }
      }
    })
    table.insert(gls.left, {
      GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = { 'NONE', colors.gitbg },
        highlight = { colors.gittext, colors.gitbg }
      }
    })
    -- }}}3

    -- Git Changes {{{3
    table.insert(gls.left, {
      DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = { colors.green, colors.gitbg }
      }
    })
    table.insert(gls.left, {
      DiffModified = {
        provider = 'DiffModified',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = { colors.blue, colors.gitbg }
      }
    })
    table.insert(gls.left, {
      DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.check_git_workspace,
        icon = '  ',
        highlight = { colors.red, colors.gitbg }
      }
    })
    table.insert(gls.left, {
      EndGit = {
        provider = function() return rightbracket end,
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { colors.gitbg, colors.bg },
        highlight = { colors.gitbg, colors.bg }
      }
    })
    -- }}}3

    -- }}}2

    -- Lsp Section {{{2

    -- Lsp Client {{{3
    table.insert(gls.left, {
      LspStart = {
        provider = function() return leftbracket end,
        highlight = { colors.lspicon, colors.bg }
      }
    })
    table.insert(gls.left, {
      LspIcon = {
        provider = function()
          local name = ""
          if gl.lspclient ~= nil then
            name = gl.lspclient()
          end
          return ' ' .. name
        end,
        highlight = { colors.lspbg, colors.lspicon }
      }
    })
    table.insert(gls.left, {
      LspMid = {
        provider = function() return rightbracket .. ' ' end,
        highlight = { colors.lspicon, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      ShowLspClient = {
        provider = 'GetLspClient',
        highlight = { colors.textbg, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      LspSpace = {
        provider = function() return ' ' end,
        highlight = { colors.lspicon, colors.lspbg }
      }
    })

    -- Codeium
    table.insert(gls.left, {
      CodeiumIcon = {
        provider = function()
          return '  '
        end,
        highlight = { colors.lspicon, colors.lspbg }
      }
    })

    table.insert(gls.left, {
      codeium_status = {
        provider = function()
          local success, status_string = pcall(vim.api.nvim_call_function, 'codeium#GetStatusString', {})
          if not success then
            status_string = "No activated"
          end
          return status_string
        end,
        highlight = { colors.textbg, colors.lspbg }
      }
    })

    table.insert(gls.left, {
      CodeiumSpace = {
        provider = function() return ' ' end,
        highlight = { colors.lspicon, colors.lspbg }
      }
    })

    -- }}}3

    -- Diagnostics {{{3
    table.insert(gls.left, {
      DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        separator_highlight = { colors.gitbg, colors.bg },
        highlight = { colors.diagerror, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = { colors.diagwarn, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = { colors.diaghint, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = { colors.diaginfo, colors.lspbg }
      }
    })
    table.insert(gls.left, {
      LspSectionEnd = {
        provider = function() return rightbracket .. " " end,
        highlight = { colors.lspbg, colors.bg }
      }
    })
    -- }}}3

    -- GPS {{{3

    table.insert(gls.left, {
      GpsStart = {
        provider = function() return leftbracket end,
        highlight = { colors.gpsicon, colors.bg }
      }
    })

    table.insert(gls.left, {
      GpsIcon = {
        provider = function()
          return '  '
        end,
        highlight = { colors.gpstext, colors.gpsicon }
      }
    })

    table.insert(gls.left, {
      GpsMid = {
        provider = function() return rightbracket .. ' ' end,
        highlight = { colors.gpsicon, colors.gpsbg }
      }
    })

    table.insert(gls.left, {
      GpsFile = {
        provider = function()
          return vim.fn.expand('%:p'):gsub(vim.fn.getcwd() .. '/', '') .. " "
        end,
        -- separator_highlight = { colors.typeicon, colors.gpsbg },
        -- separator = "   ",
        highlight = { colors.gpstext, colors.gpsbg },
        color_mode = true
      }
    })

    -- table.insert(gls.left, {
    --   GpsSymbol = {
    --     provider = function()
    --       return require('nvim-navic').get_location()
    --     end,
    --     condition = function()
    --       return require('nvim-navic').is_available() and #require('nvim-navic').get_location() > 0
    --     end,
    --     highlight = { colors.gpstext, colors.gpsbg },
    --     color_mode = true
    --   }
    -- })

    table.insert(gls.left, {
      GpsEnd = {
        provider = function() return rightbracket .. " " end,
        highlight = { colors.gpsbg, colors.bg }
      }
    })

    -- }}}3

    -- }}}2

    -- }}}1

    -- Right {{{1
    gls.right = {}

    -- Type {{{2
    table.insert(gls.right, {
      TypeStart = {
        provider = function() return leftbracket end,
        highlight = { colors.typeicon, colors.bg }
      }
    })
    table.insert(gls.right, {
      TypeFileFormatIcon = {
        provider = function()
          local icon = icons[vim.bo.fileformat] or ''
          return string.format(' %s', icon)
        end,
        highlight = { colors.typebg, colors.typeicon }
      }
    })
    table.insert(gls.right, {
      TypeMid = {
        provider = function() return rightbracket .. ' ' end,
        highlight = { colors.typeicon, colors.typebg }
      }
    })

    --[[table.insert(gls.left, {
    FileName = {
      provider = function()
        if #vim.fn.expand '%:p' == 0 then
          return ''
        end

        if 'relato' == 'relative' then
          local fname = vim.fn.expand('%:p')
          return fname:gsub(vim.fn.getcwd() .. '/', '') .. ' '
        end

        return vim.fn.expand '%:t' .. ' '
      end,
      separator = '  ',
      separator_highlight = { colors.typeicon, colors.typebg },
      highlight = { colors.typetext, colors.typebg }
    }
  })
]]
    --[[if EcoVim.statusline.path_enabled then
  table.insert(gls.right, {
    FileName = {
      provider = function()
        if #vim.fn.expand '%:p' == 0 then
          return ''
        end

        if EcoVim.statusline.path == 'relative' then
          local fname = vim.fn.expand('%:p')
          return fname:gsub(vim.fn.getcwd() .. '/', '') .. ' '
        end

        return vim.fn.expand '%:t' .. ' '
      end,
      separator_highlight = { 'NONE', colors.typebg },
      highlight = { colors.typetext, colors.typebg }
    }
  })
end]]
    table.insert(gls.right, {
      FileIcon = {
        provider = 'FileIcon',
        highlight = { colors.typeicon, colors.typebg }
      }
    })
    table.insert(gls.right, {
      BufferType = {
        provider = 'FileTypeName',
        highlight = { colors.typetext, colors.typebg }
      }
    })
    table.insert(gls.right, {
      FileSize = {
        provider = 'FileSize',
        separator = '  ',
        separator_highlight = { colors.typeicon, colors.typebg },
        highlight = { colors.typetext, colors.typebg }
      }
    })
    table.insert(gls.right, {
      FileEncode = {
        provider = 'FileEncode',
        separator = '',
        separator_highlight = { colors.typeicon, colors.typebg },
        highlight = { colors.typetext, colors.typebg }
      }
    })
    table.insert(gls.right, {
      TypeSectionEnd = {
        provider = function() return rightbracket end,
        separator = " ",
        separator_highlight = { colors.typebg, colors.typebg },
        highlight = { colors.typebg, colors.bg }
      }
    })
    table.insert(gls.right, {
      Space = {
        provider = function() return ' ' end,
        highlight = { colors.typebg, colors.bg }
      }
    })
    -- }}}2

    -- Cursor Position Section {{{2
    table.insert(gls.right, {
      StatsSectionStart = {
        provider = function() return leftbracket end,
        highlight = { colors.statsicon, colors.bg }
      }
    })
    table.insert(gls.right, {
      StatsIcon = {
        provider = function()
          return '⅑'
        end,
        highlight = { colors.statsbg, colors.statsicon }
      }
    })
    table.insert(gls.right, {
      StatsMid = {
        provider = function() return rightbracket .. ' ' end,
        highlight = { colors.statsicon, colors.statsbg }
      }
    })
    table.insert(gls.right, {
      PerCent = {
        provider = 'LinePercent',
        highlight = { colors.statstext, colors.statsbg }
      }
    })
    table.insert(gls.right, {
      VerticalPosAndSize = {
        provider = function()
          return string.format(" %s /%4i ", vim.fn.line('.'), vim.fn.line('$'))
        end,
        separator = '',
        separator_highlight = { colors.statsicon, colors.statsbg },
        highlight = { colors.statstext, colors.statsbg }
      }
    })
    table.insert(gls.right, {
      CursorColumnStart = {
        provider = function()
          return leftbracket
        end,
        separator = ' ',
        separator_highlight = { colors.statsicon, colors.statsbg },
        highlight = 'LinePosHighlightStart'
      }
    })
    table.insert(gls.right, {
      CursorColumn = {
        provider = function()
          setLineWidthColours()
          return "" .. string.format("%3i", vim.fn.col('.')) .. " /"
        end,
        highlight = 'LinePosHighlightColNum'
      }
    })
    table.insert(gls.right, {
      LineLengthStart = {
        provider = function()
          return " " .. leftbracket
        end,
        highlight = 'LinePosHighlightMid'
      }
    })
    table.insert(gls.right, {
      LineLength = {
        provider = function()
          return ' ' .. string.format("%3i", string.len(vim.fn.getline('.')))
        end,
        highlight = 'LineLenHighlightLenNum'
      }
    })
    table.insert(gls.right, {
      LineLengthEnd = {
        provider = function()
          return " " .. rightbracket .. " "
        end,
        highlight = 'LinePosHighlightEnd'
      }
    })
    table.insert(gls.right, {
      TabOrSpace = {
        provider = function()
          if vim.bo.expandtab
          then
            return '  '
          else
            return '  '
          end
        end,
        condition = condition.hide_in_width,
        highlight = { colors.statsicon, colors.statsbg }
      }
    })
    table.insert(gls.right, {
      Tabstop = {
        provider = function()
          return vim.bo.shiftwidth .. " "
        end,
        condition = condition.hide_in_width,
        highlight = { colors.statstext, colors.statsbg }
      }
    })
    table.insert(gls.right, {
      StatsSpcSectionEnd = {
        provider = function() return rightbracket .. " " end,
        highlight = { colors.statsbg, colors.bg }
      }
    })
    -- }}}2

    -- }}}1

    -- Left Short {{{1
    gls.short_line_left = {}

    table.insert(gls.short_line_left, {
      ShortSectionStart = {
        provider = function() return leftbracket end,
        highlight = { colors.shortbg, colors.bg }
      }
    })
    table.insert(gls.short_line_left, {
      ShortSectionSpace = {
        provider = function() return " " end, highlight = { colors.shorttext, colors.shortbg }
      }
    })
    table.insert(gls.short_line_left, {
      LeftShortName = {
        provider = 'FileTypeName',
        highlight = { colors.shorttext, colors.shortbg },
      }
    })
    table.insert(gls.short_line_left, {
      ShortSectionMid = {
        provider = function() return " " end,
        highlight = { colors.shortbg, colors.shortbg }
      }
    })
    table.insert(gls.short_line_left, {
      LeftShortFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        separator_highlight = { colors.shorttext, colors.shortbg },
        highlight = { colors.shorttext, colors.shortbg },
      }
    })
    table.insert(gls.short_line_left, {
      ShortSectionEnd = {
        provider = function() return rightbracket end,
        highlight = { colors.shortbg, colors.bg }
      }
    })
    -- }}}1

    -- Right Short {{{1
    gls.short_line_right = {}

    table.insert(gls.short_line_right, {
      BufferIcon = {
        provider = 'BufferIcon',
        separator_highlight = { colors.shorttext, colors.bg },
        highlight = { colors.textbg, colors.bg }
      }
    })
  end
}
