vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

-- save file
vim.api.nvim_set_keymap("n", "<leader>o", ":w<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- scroll
vim.keymap.set({"n", "v"}, "<Down>", "<C-f>", { noremap = true, silent = false })
vim.keymap.set({"n", "v"}, "<Up>", "<C-b>", { noremap = true, silent = false })

-- hlslens
vim.api.nvim_set_keymap("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>noh<CR>", { noremap = true, silent = false })
