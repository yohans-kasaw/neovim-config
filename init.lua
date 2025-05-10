Icons = require("user.icons")
vim.g.mapleader = " "

require("user.options")
require("user.core")
require("user.cmp")
require("user.lsp")

-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme kanso-ink")

vim.lsp.enable({
	"lua_ls",
	"sqlls",
	"ts_ls",
	"volar"
})

vim.diagnostic.config({
	float = {
		border = "double",
	},
})
