function print_lua(...)
  local args = {...}

  local mapped = {}
  for _, v in ipairs(args) do
    table.insert(mapped, vim.inspect(v))
  end
  vim.notify(unpack(mapped))

  return unpack(args)
end
