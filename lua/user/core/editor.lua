return {
	plugins = {
		{
			"arthurxavierx/vim-caser",
			event = "VeryLazy",
		},
		{
			"mcauley-penney/visual-whitespace.nvim",
			config = true,
			event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
			opts = {},
		},
	},
	keys = function()
		vim.api.nvim_set_keymap("n", "<leader>o", ":w<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { noremap = true, desc = "Deletes to black hole register" })
	end,
}
