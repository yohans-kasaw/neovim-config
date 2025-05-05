return {
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
			local lualine = require("lualine")

			local filetype = { "filetype", icon_only = true }

			local lsp_status = {
				"lsp_status",
				symbols = {
					spinner = Icons.spinner,
					done = false,
					separator = " ",
				},
				ignore_lsp = {},
			}

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
		end,
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		local highlights = require("nord").bufferline.highlights({
	-- 			italic = false,
	-- 		})
	-- 		require("bufferline").setup({
	-- 			highlights = highlights,
	-- 			options = {
	--                }
	-- 		})
	-- 	end,
	-- },
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
		"lukas-reineke/virt-column.nvim",
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
	},
	{
		"Shatur/neovim-ayu",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"rose-pine/neovim",
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"gruvbox",
					"ayu",
					"kanagawa-wave",
					"tokyonight",
					"tokyonight-storm",
					"catppuccin",
					"catppuccin-mocha",
					"rose-pine"
				},
				livePreview = true,
			})
		end,
	},
}
