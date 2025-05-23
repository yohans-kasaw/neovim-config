return {
	plugins = {
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				top_down = false,
			},
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
		},
		{
			"nvim-tree/nvim-tree.lua",
			config = function()
				require("nvim-tree").setup({
					on_attach = function(bufnr)
						local api = require("nvim-tree.api")
						api.config.mappings.default_on_attach(bufnr)

						vim.keymap.set("n", "l", api.node.open.edit)
						vim.keymap.set("n", "h", api.node.navigate.parent_close)
						vim.keymap.set("n", "<CR>", api.node.open.preview)
					end,
					view = {
						side = "right",
					},

					diagnostics = {
						enable = true,
					},
				})
			end,
		},
		{
			"folke/zen-mode.nvim",
		},
		{
			"nvim-tree/nvim-web-devicons",
		},
		{
			"yamatsum/nvim-cursorline",
			config = function()
				require("nvim-cursorline").setup({
					cursorline = {
						enable = true,
						timeout = 1000,
						number = false,
					},
					cursorword = {
						enable = true,
						min_length = 3,
						hl = { underline = true },
					},
				})
			end,
		},
		{
			"m4xshen/smartcolumn.nvim",
			opts = {},
		},
		{
			"OXY2DEV/helpview.nvim",
			lazy = false,
		},
		{
			"webhooked/kanso.nvim",
			lazy = false,
			priority = 1000,
		},
		{
			"rebelot/kanagawa.nvim",
			config = function()
				require("kanagawa").setup()
			end,
		},
		{
			"xiyaowong/transparent.nvim",
			lazy = false,
			priority = 1000,
		},
	},
	keys = function()
		vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
