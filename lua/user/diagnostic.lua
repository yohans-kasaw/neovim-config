vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	severity_sort = true,
	float = {
		focusable = true,
		style = "normal",
		border = "double",
		source = "if_many",
		header = "",
		prefix = "",
	},
 signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'e',
            [vim.diagnostic.severity.WARN] = 'w',
            [vim.diagnostic.severity.INFO] = 'i',
            [vim.diagnostic.severity.HINT] = 'h',
        }
    }
})
