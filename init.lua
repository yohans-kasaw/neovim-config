Icons = require("user.icons")

require("user.options")

require("user.plugins")
require("user.lsp")
require("user.diagnostic")
require("user.cmp")
require("user.nvim_tree")
require("user.keymaps")
require("user.conform")
require("user.neovide")
require("user.auto_cmd")

vim.cmd("colorscheme kanagawa-wave")
vim.lsp.enable({
	"lua_ls",
	"sqlls",
	"ts_ls",
})
