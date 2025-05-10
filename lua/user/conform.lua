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
				"--skip-string-normalization", -- Don't normalize string quotes or prefixes
				"--skip-magic-trailing-comma", -- Don't use trailing commas as a reason to split lines
			},
		},
		prettierd = {
			prepend_args = {
				"--tab-width",
				"4",
				"--single-quote",
				"--no-semi",
				"--trailing-comma",
				"none",
			},
		},
		prettier = {
			prepend_args = {
				"--tab-width",
				"4",
				"--single-quote",
				"--no-semi",
				"--trailing-comma",
				"none",
			},
		},
	},
})
