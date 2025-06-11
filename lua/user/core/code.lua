return {
	plugins = {
		{
			"neovim/nvim-lspconfig",
			config = function()
				local lspconfig = require("lspconfig")

				lspconfig.ts_ls.setup({
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = "/usr/lib/node_modules/@vue/typescript-plugin",
								languages = { "javascript", "typescript", "vue" },
							},
						},
					},
					filetypes = {
						"javascript",
						"typescript",
						-- "vue",
					},
				})

				lspconfig.volar.setup({
					filetypes = {
						"vue",
					},
					init_options = {
						typescript = {
							tsdk = "/usr/lib/node_modules/typescript/lib",
						},
					},
				})

				lspconfig.pyright.setup({
					before_init = function(_, config)
						config.settings.python.analysis.stubPath =
							vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs")
					end,
				})

				lspconfig.cssls.setup({})
			end,
		},
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/nvim-cmp" },
		{ "onsails/lspkind.nvim" },
		{
			"williamboman/mason.nvim",
		},
		{
			"williamboman/mason-lspconfig.nvim",
		},
		{
			"stevearc/conform.nvim",
			cmd = { "ConformInfo" },
			lazy = false,
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						python = { "black" },
						javascript = { "prettier" },
						typescript = { "prettier" },
						javascriptreact = { "prettier" },
						typescriptreact = { "prettier" },
						css = { "prettier" },
						html = { "prettier" },
						json = { "prettier" },
						yaml = { "prettier" },
						vue = { "prettier" },
					},
					formatters = {
						black = {
							prepend_args = {
								"--skip-string-normalization",
								"--skip-magic-trailing-comma",
							},
						},
						prettier = {
							prepend_args = {
								"--tab-width",
								"4",
								"--single-quote",
								"--no-semi",
								"--trailing-comma",
								"all",
							},
						},
					},
				})
			end,
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "andymass/vim-matchup" },
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
					indent = {
						enable = true,
						disable = { "markdown" },
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "<CR>",
							node_incremental = "<CR>",
						},
					},
				})
			end,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
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
			"Wansmer/treesj",
			config = function()
				require("treesj").setup({})
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		},
		{ "microsoft/python-type-stubs" },
		{
			"supermaven-inc/supermaven-nvim",
			config = function()
				require("supermaven-nvim").setup({
					keymaps = {
						accept_suggestion = "<A-l>",
						clear_suggestion = "<A-h>",
					},
					ignore_filetypes = { markdown = true },
					disable_keymaps = true,
				})
			end,
		},
	},
	keys = function()
		vim.keymap.set("n", "gl", function()
			vim.diagnostic.open_float(nil, {})
		end, { noremap = true, silent = true, desc = "Show Line Diagnostics" })

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			require("conform").format({
				lsp_fallback = false,
				async = false,
				timeout_ms = 500,
			})
		end, {
			desc = "Format file or range (in visual mode)",
		})
	end,
}
