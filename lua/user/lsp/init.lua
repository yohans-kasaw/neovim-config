--
local lspconfig = require("lspconfig")
lspconfig.volar.setup({
    filetypes = {
        'vue',
    },
    init_options = {
        typescript = {
            tsdk = '/usr/lib/node_modules/typescript/lib',
        },
    },
})


require("lspconfig").pyright.setup({
	before_init = function(_, config)
		config.settings.python.analysis.stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs")
	end,
})
