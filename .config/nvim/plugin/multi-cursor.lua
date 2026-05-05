vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim", })

local mc = require("multicursor-nvim")
mc.setup()

-- Add cursors above/below the main cursor.
vim.keymap.set({ "n", "v" }, "<C-A-k>", function() mc.addCursor("k") end)
vim.keymap.set({ "n", "v" }, "<C-A-j>", function() mc.addCursor("j") end)

-- Add a cursor and jump to the next word under cursor.
vim.keymap.set({ "n", "v" }, "<c-n>", function() mc.addCursor("*") end)

-- Jump to the next word under cursor but do not add a cursor.
vim.keymap.set({ "n", "v" }, "<c-m>", function() mc.skipCursor("*") end)

-- Rotate the main cursor.
vim.keymap.set({ "n", "v" }, "<C-A-l>", mc.nextCursor)
vim.keymap.set({ "n", "v" }, "<C-A-h>", mc.prevCursor)

-- Delete the main cursor.
vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Align cursor columns.
vim.keymap.set("n", "<c-a>", mc.alignCursors)

-- Split visual selections by regex.
vim.keymap.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
vim.keymap.set("v", "I", mc.insertVisual)
vim.keymap.set("v", "A", mc.appendVisual)

-- match new cursors within visual selections by regex.
vim.keymap.set("v", "M", mc.matchCursors)

-- Rotate visual selection contents.
vim.keymap.set("v", "<leader>t", function() mc.transposeCursors(1) end)
vim.keymap.set("v", "<leader>T", function() mc.transposeCursors(-1) end)
