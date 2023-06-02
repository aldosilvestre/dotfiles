print_lua = function(...)
  local args = {...}

  local mapped = {}
  for _, v in ipairs(args) do
    table.insert(mapped, vim.inspect(v))
  end
  print(table.unpack(mapped))

  return table.unpack(args)
end
