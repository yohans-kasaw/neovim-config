Icons = require("user.icons")
vim.g.mapleader = " "

require("user.options")
require("user.core")
require("user.cmp")
require("user.autocmd")

vim.cmd("colorscheme kanso-zen")

vim.lsp.enable({
	"lua_ls",
	-- "ts_ls",
	"volar"
})

vim.diagnostic.config({
	float = {
		border = "double",
		source = true
	},
})
