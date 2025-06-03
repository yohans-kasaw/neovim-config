return {
	plugins = {
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		},
		{
			"echasnovski/mini.nvim",
			version = false,
			config = function()
				require("mini.diff").setup()
			end,
		},
	},
	keys = function()
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

		-- custom
		vim.keymap.set("n", "md", "^i[x]<Esc>", { noremap = true, silent = false, desc = "add [x]" })
	end,
}
