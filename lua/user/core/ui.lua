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
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("transparent").clear_prefix("lualine")
				local transparent_ok, transparent = pcall(require, "transparent")

				local lualine = require("lualine")

				local diagnostics = {
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = Icons.diagnostics.Error,
						hint = Icons.diagnostics.Hint,
						info = Icons.diagnostics.Info,
						warn = Icons.diagnostics.Warning,
					},
					colored = true,
					update_in_insert = false,
					always_visible = false,
				}

				require("lualine").setup({
					options = {
						globalstatus = true,
						section_separators = "",
						component_separators = "",
						theme = "ayu_mirage",
						disabled_filetypes = {
							statusline = {
								"dashboard",
								"lazy",
								"alpha",
							},
						},
					},
					sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = { { "filename", path = 1, shorten = true }, "branch" },
						lualine_x = {},
						-- lualine_y = {diagnostics, lsp_status},
						lualine_y = { diagnostics },
						lualine_z = {},
					},
				})

				if transparent_ok then
					transparent.clear_prefix("lualine")
				end
			end,
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
