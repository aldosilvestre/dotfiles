local M = {}

M.addDescription = function(table, desc)
  table['desc'] = desc
  return table
end

M.highlight = function(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then
    cmd = cmd .. ' gui=' .. gui
  end
  vim.cmd(cmd)
end

return M
