Icons = require("user.icons")
vim.g.mapleader = " "

require("user.options")
require("user.core")
require("user.lsp")
require("user.diagnostic")
require("user.cmp")
require("user.nvim_tree")
require("user.conform")
require("user.neovide")
require("user.auto_cmd")

-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme kanso-ink")

vim.lsp.enable({
	"lua_ls",
	"sqlls",
	"ts_ls",
	"volar"
})


