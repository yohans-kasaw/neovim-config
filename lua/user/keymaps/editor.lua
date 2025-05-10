vim.keymap.set('n', '<leader>.', function() Snacks.scratch() end, {desc = "Toggle Scratch Buffer" })

function insertFullPath()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', '"' .. filepath .. '"') -- write to clippoard

end

vim.keymap.set('n', 'Q', '@q', { noremap = true, desc="Easy repeating of macro saved to q register" })

vim.keymap.set({'n','x'}, '<leader>d', '"_d', { noremap = true, desc="Deletes to black hole register" })

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
