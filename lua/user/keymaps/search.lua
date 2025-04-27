vim.api.nvim_set_keymap(
        'n',
        '<leader>p',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true, desc="telescope.project"}
)


vim.keymap.set("n", "<leader>f ", function()
        fuzzy.files(vim.fn.expand "%:h")
end, { desc = "Files in CWD"})
vim.keymap.set("n", "<leader>f/", require("fzf-lua").grep, { desc = "Grep"})
vim.keymap.set("n", "<leader>f*", require("fzf-lua").grep_cword, { desc = "Search word under cursor"})
vim.keymap.set("n", "<leader>fg", require("fzf-lua").git_files, { desc = "Git Files"})
vim.keymap.set("n", "<leader>fs", require("fzf-lua").lsp_finder, { desc = "lsp finder"})
vim.keymap.set("n", "<leader>fc", require("fzf-lua").commands, { desc = "Commands"})
vim.keymap.set("n", "<leader>fr", require("fzf-lua").resume, { desc = "resume"})
vim.keymap.set("n", "<leader>fj", require("fzf-lua").jumps, { desc = "jumps"})

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap(
	"n",
	"<Leader>*",
	"<Cmd>Telescope grep_string word_match=-w<CR>",
	{ desc = "Search word under cursor" }
)

vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>up", function()
	Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>u", function()
	Snacks.picker.buffers()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })

vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
