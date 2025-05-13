return {
	plugins = {
		{
			"echasnovski/mini.nvim",
			version = false,
			config = function()
				require("mini.diff").setup()
			end,
		},
	},
	keys = function()
		-- mark down
		vim.opt.linebreak = true
		vim.opt.breakindent = true

		-- mini.diff
		vim.keymap.set("n", ";d", MiniDiff.toggle_overlay, { desc = "MiniDiff Toggle" })

		vim.keymap.set("n", "<leader>c", "<cmd>CodeCompanionChat Toggle<CR>", { noremap = true, silent = false })
		vim.keymap.set("v", "<leader>c", "<cmd>CodeCompanionChat Add<CR>", { noremap = true, silent = false })
		vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionAction<CR>", { noremap = true, silent = false })
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])

		vim.keymap.set("n", "<leader>w", function()
			local win_id = vim.api.nvim_get_current_win()
			local current_width = vim.api.nvim_win_get_width(win_id)
			local total_width = vim.o.columns
			vim.api.nvim_win_set_width(
				win_id,
				current_width == math.floor(total_width * 0.8) and math.floor(total_width * 0.5)
					or math.floor(total_width * 0.8)
			)
		end, { noremap = true, silent = true, desc = "Toggle vertical split width" })

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
			require("harpoon.<A-i>").nav_file(4)
		end, { noremap = true, silent = false })
	end,
}
