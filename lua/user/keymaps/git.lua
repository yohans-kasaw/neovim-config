vim.keymap.set("n", "<leader>d", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end, { desc = "Toggle Diff View" })


vim.keymap.set("n", "<leader>bl", function()
    Snacks.git.blame_line({
        width = 0.6,
        height = 0.6,
        border = "rounded",
        title = " Git Blame ",
        count = 6,
    })
end, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gb", function()
    Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
    Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gs", function()
    Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
    Snacks.picker.git_stash()
end, { desc = "Git Stash" })


vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Lazygit" })
