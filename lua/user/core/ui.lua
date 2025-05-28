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
					view = {
						side = "right",
					},

					renderer = {
						full_name = true,
						group_empty = true,
						indent_markers = {
							enable = true,
						},
						icons = {
							git_placement = "signcolumn",
							show = {
								folder = false,
							},
						},
					},
					diagnostics = {
						enable = true,
						show_on_dirs = true,
					},
					update_focused_file = {
						enable = true,
					},
					filters = {
						custom = {
							"^.git$",
						},
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
		vim.api.nvim_set_keymap(
            "n",
            "<leader>e",
            ":NvimTreeToggle<CR>",
            { noremap = true, silent = true }
        )
	end,
}
