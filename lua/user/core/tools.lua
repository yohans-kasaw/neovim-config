return {
	plugins = {
		{
			"folke/persistence.nvim",
			event = "BufReadPre",
			opts = {},
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				preset = "modern",
			},
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
		},
	},
	keys = function()
		vim.keymap.set("n", "<leader>s", function()
			require("persistence").load()
		end, { desc = "select a session to load" })
	end,
}
