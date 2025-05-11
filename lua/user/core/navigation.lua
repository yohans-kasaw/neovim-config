return {
	plugins = {
		{
			"ThePrimeagen/harpoon",
		},
		{
			"kelly-lin/ranger.nvim",
		},
	},
	keys = function()
		-- Close all other buffers

		vim.keymap.set("n", "ta", function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if buf ~= vim.api.nvim_get_current_buf() then
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

		vim.api.nvim_set_keymap("n", "tn", "<cmd>bnext<CR>", { noremap = true, silent = false })
		vim.api.nvim_set_keymap("n", "th", "<cmd>bprev<CR>", { noremap = true, silent = false })
		vim.api.nvim_set_keymap("n", "td", "<cmd>bd<CR>", { noremap = true, silent = false })

		vim.api.nvim_set_keymap("n", "<leader>r", "", {
			noremap = true,
			callback = function()
				require("ranger-nvim").open(true)
			end,
			desc = "open ranger",
		})
	end,
}
