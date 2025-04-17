return {
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
	{
		"windwp/nvim-autopairs",
		config = function()
	require("nvim-autopairs").setup()
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
	require("hlslens").setup({
		nearest_only = true,
		nearest_float_when = "never",
		override_lens = function(render, plist, nearest, idx, relIdx) end,
		calm_down = true,
		enable_incsearch = false,
	})
	vim.api.nvim_set_hl(0, "HlSearchNear", { fg = "#000000", bg = "#ffffff" })
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
	require("nvim-surround").setup({})
		end,
	},
	{
		"arthurxavierx/vim-caser",
		event = "VeryLazy",
	},
	{
		"Wansmer/treesj",
		requires = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
		config = function()
	require("treesj").setup({--[[ your config ]]
	})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
	require("nvim-ts-autotag").setup({})
		end,
	},
	{ "microsoft/python-type-stubs" },
}
