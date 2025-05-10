return {
	plugins = {
		{ "aaronik/treewalker.nvim" },
	},
	keys = function()
		vim.keymap.set({ "n", "v", "o" }, "H", "0", { noremap = true })
		vim.keymap.set({ "n", "v", "o" }, "L", "$", { noremap = true })

		vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

		vim.keymap.set({ "n", "v" }, "<Down>", "<C-f>", { noremap = true, silent = false })
		vim.keymap.set({ "n", "v" }, "<Up>", "<C-b>", { noremap = true, silent = false })

		vim.keymap.set({ "n", "v" }, "<S-Up>", "<cmd>Treewalker Up<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Down>", "<cmd>Treewalker Down<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Left>", "<cmd>Treewalker Left<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Right>", "<cmd>Treewalker Right<cr>", { silent = true })
	end,
}
