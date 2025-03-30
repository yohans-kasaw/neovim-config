vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope<CR>", { noremap = true, silent = false })

vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>up", function()
    Snacks.picker.projects()
end, { desc = "Projects" })
