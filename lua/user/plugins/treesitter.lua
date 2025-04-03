return {
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				modules = {},
				ignore_install = {},
				ensure_installed = "all",
				sync_install = true,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				refactor = {
					smart_rename = {
						enable = true,
						keymaps = {
							smart_rename = "grr",
						},
					},
				},
			})
		end,
	},
}
