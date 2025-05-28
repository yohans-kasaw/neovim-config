local group = vim.api.nvim_create_augroup("helpfullwindow", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = group,
	pattern = "*.txt",
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd("wincmd T")
		end
	end,
})
