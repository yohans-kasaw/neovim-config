
-- Close other buffers
vim.keymap.set("n", "ta", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { noremap = true, silent = true, desc = "Close Other Buffers (Tab All)" })

-- Window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-v>", ":vsplit<CR>", { noremap = true, silent = false })


-- harppon
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file, { noremap = true, silent = false })
vim.keymap.set("n", "<leader>l", require("harpoon.ui").toggle_quick_menu, { noremap = true, silent = false })
vim.keymap.set("n", "tn", require("harpoon.ui").nav_next , { noremap = true, silent = false })
vim.keymap.set("n", "th", require("harpoon.ui").nav_prev, { noremap = true, silent = false })

vim.keymap.set("n", "ta", function () require("harpoon.ui").nav_file(1) end  , { noremap = true, silent = false })
vim.keymap.set("n", "to", function () require("harpoon.ui").nav_file(2) end  , { noremap = true, silent = false })
vim.keymap.set("n", "te", function () require("harpoon.ui").nav_file(3) end  , { noremap = true, silent = false })
vim.keymap.set("n", "tu", function () require("harpoon.ui").nav_file(4) end  , { noremap = true, silent = false })

-- Buffer navigation
-- vim.api.nvim_set_keymap("n", "tn", "<cmd>bnext<CR>", { noremap = true, silent = false })
-- vim.api.nvim_set_keymap("n", "th", "<cmd>bprev<CR>", { noremap = true, silent = false })
-- vim.api.nvim_set_keymap("n", "td", "<cmd>bd<CR>", { noremap = true, silent = false })
