vim.keymap.set("n", "<leader>s", function()
	require("persistence").load()
end, { desc = "select a session to load" })

vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "load the session for the current directory" })

vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "select a session to load" })

vim.keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "load the last session" })

vim.keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "stop Persistence => session won't be saved on exit" })
