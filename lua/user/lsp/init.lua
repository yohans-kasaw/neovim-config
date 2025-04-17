--
local lspconfig = require("lspconfig")
lspconfig.volar.setup({})

require("lspconfig").pyright.setup({
	before_init = function(_, config)
		config.settings.python.analysis.stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs")
	end,
})

-- require("mason").setup()
-- require("mason-lspconfig").setup()
--
-- -- lspconfig.eslint.setup({
-- --     capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- -- })
--
-- lspconfig.cssls.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.dartls.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.gopls.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.lua_ls.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.pyright.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.rust_analyzer.setup({
-- })
--
-- lspconfig.ts_ls.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- lspconfig.volar.setup({
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
