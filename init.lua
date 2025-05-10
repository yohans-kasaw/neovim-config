Icons = require("user.icons")
vim.g.mapleader = " "

require("user.options")
require("user.core")
require("user.cmp")

-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme kanso-ink")

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"volar"
})

vim.diagnostic.config({
	float = {
		border = "double",
	},
})
