Icons = require("user.icons")

require("user.options")
require("user.plugins")
require("user.lsp")
require("user.diagnostic")
require("user.cmp")
require("user.nvim_tree")
require("user.keymaps")
require("user.conform")

vim.cmd("colorscheme kanagawa-wave")
-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  pattern = '*',
  command = 'silent! normal! g`"zv'
})
-- vim.g.neovide_transparency = 0.6
-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]])
-- increase gui font size
