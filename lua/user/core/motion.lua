return {
	plugins = {
		{ "aaronik/treewalker.nvim" },
		{
			"ggandor/leap.nvim",
			config = function()
				require("leap").setup({
					safe_labels = {},
					preview_filter = function()
						return false
					end,
				})
			end,
		},
	},
	keys = function()
		vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap)")
		vim.keymap.set({ "n", "x", "o" }, "gs", function()
			require("leap.remote").action()
		end)

		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
		vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
		vim.keymap.set({ "n", "v", "o" }, "H", "0", { noremap = true })
		vim.keymap.set({ "n", "v", "o" }, "L", "$", { noremap = true })

		vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

		vim.keymap.set({ "n", "v" }, "<Down>", "<C-f>zz", { noremap = true, silent = false })
		vim.keymap.set({ "n", "v" }, "<Up>", "<C-b>zz", { noremap = true, silent = false })

		vim.keymap.set({ "n", "v" }, "<S-Up>", "<cmd>Treewalker Up<cr>zz", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Down>", "<cmd>Treewalker Down<cr>zz", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Left>", "<cmd>Treewalker Left<cr>zz", { silent = true })
		vim.keymap.set({ "n", "v" }, "<S-Right>", "<cmd>Treewalker Right<cr>zz", { silent = true })
	end,
}
