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
		{
			"leath-dub/snipe.nvim",
			opts = {
				ui = {
					position = "cursor",
				},
			},
		},
		{
			"kungfusheep/snipe-lsp.nvim",
			event = "VeryLazy",
			dependencies = "leath-dub/snipe.nvim",
			opts = {},
		},
	},
	keys = function()
		vim.keymap.set("n", "<C-h>", "<C-o>")
		vim.keymap.set("n", "<C-l>", "<C-i>")

		vim.keymap.set("n", "<leader>b", function()
			require("snipe").open_buffer_menu()
		end, { desc = "Open Snipe buffer menu" })

		vim.keymap.set("n", "gs", "<cmd>SnipeLspSymbols<CR>", { desc = "Open Snipe Lsp symbols menu" })

		vim.keymap.set("n", "<leader>h", require("harpoon.mark").add_file, { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>l", require("harpoon.ui").toggle_quick_menu, { noremap = true, silent = false })

		vim.keymap.set("n", "tn", require("harpoon.ui").nav_next, { noremap = true, silent = false })
		vim.keymap.set("n", "th", require("harpoon.ui").nav_prev, { noremap = true, silent = false })

		vim.keymap.set("n", "<A-a>", function()
			require("harpoon.ui").nav_file(1)
		end, { noremap = true, silent = false })
		vim.keymap.set("n", "<A-o>", function()
			require("harpoon.ui").nav_file(2)
		end, { noremap = true, silent = false })
		vim.keymap.set("n", "<A-e>", function()
			require("harpoon.ui").nav_file(3)
		end, { noremap = true, silent = false })
		vim.keymap.set("n", "<A-u>", function()
			require("harpoon.ui").nav_file(4)
		end, { noremap = true, silent = false })
		vim.keymap.set("n", "<A-i>", function()
			require("harpoon.i").nav_file(5)
		end, { noremap = true, silent = false })

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
