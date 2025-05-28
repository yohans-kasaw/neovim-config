return {
	plugins = {
		{
			"ThePrimeagen/harpoon",
			config = function()
				require("harpoon").setup({
					tabline = true,
				})
			end,
		},
		{ "kelly-lin/ranger.nvim" },
		{
			"chentoast/marks.nvim",
			event = "VeryLazy",
			opts = {
				mappings = {
					set_next = "ma",
					next = "mn",
					preview = "mp",
				},
			},
		},
		{
			"m4xshen/hardtime.nvim",
			lazy = false,
			dependencies = { "MunifTanjim/nui.nvim" },
			opts = {
				disabled_keys = {
					["<Up>"] = false,
					["<Down>"] = false,
					["<Left>"] = false,
					["<Right>"] = false,
				},
			},
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

		-- Move windows
		vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })

		-- harppon

		vim.api.nvim_set_keymap("n", "td", "<cmd>bd<CR>", { noremap = true, silent = false })
		-- vim.api.nvim_set_keymap("n", "tn", "<cmd>bnext<CR>", { noremap = true, silent = false })
		-- vim.api.nvim_set_keymap("n", "th", "<cmd>bprev<CR>", { noremap = true, silent = false })

		vim.api.nvim_set_keymap("n", "<leader>r", "", {
			noremap = true,
			callback = function()
				require("ranger-nvim").open(true)
			end,
			desc = "open ranger",
		})
	end,
}
