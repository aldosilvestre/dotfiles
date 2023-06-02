local M = {}

M.addDescription = function(table, desc)
  table['desc'] = desc
  return table
end

return M
