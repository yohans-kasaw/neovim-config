return {
	plugins = {},
	keys = function()
		vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>noh<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "Q", "@q", { noremap = true, desc = "Easy repeating of macro saved to q register" })
		vim.keymap.set("n", "<leader>fp", function()
			local filepath = vim.fn.expand("%")
			vim.fn.setreg("+", '"' .. filepath .. '"') -- write to clippoard
		end, { expr = true })
	end,
}
