require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Specify formatters for different filetypes
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
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
