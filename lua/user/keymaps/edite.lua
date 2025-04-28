vim.keymap.set('n', '<leader>.', function() Snacks.scratch() end, {desc = "Toggle Scratch Buffer" })

function insertFullPath()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', '"' .. filepath .. '"') -- write to clippoard

end

vim.keymap.set('n', '<leader>yp', insertFullPath, { noremap = true, silent = true })
