vim.g.mapleader = " "

vim.keymap.set({ 'n', 'v', 'o' }, 'H', '0', { noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$', { noremap = true })


require("user.keymaps.basic")
require("user.keymaps.navigation")
require("user.keymaps.git")
require("user.keymaps.lsp")
require("user.keymaps.search")
require("user.keymaps.treewalker")
require("user.keymaps.dev")
require("user.keymaps.edite")
require("user.keymaps.session")
