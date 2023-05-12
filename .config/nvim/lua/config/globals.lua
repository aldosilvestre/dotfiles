local M = {}

M.addDescription = function(table, desc)
  table['desc'] = desc
  return table
end

M.print = function(...)
  local args = {...}

  local mapped = {}
  for _, v in ipairs(args) do
    table.insert(mapped, vim.inspect(v))
  end
  print(table.unpack(mapped))

  return table.unpack(args)
end

return M
