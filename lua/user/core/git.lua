return {
	plugins = {
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		},
		{ "sindrets/diffview.nvim" },
	},
	keys = function()
		local gitsigns = require("gitsigns")

		vim.keymap.set("n", "<A-Down>", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next Hunk" })
		vim.keymap.set("n", "<A-Up>", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Next Hunk" })

		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk " })
		vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

		vim.keymap.set("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame Line" })

		vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff This" })

		vim.keymap.set("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "Diff This Unstaged" })
	end,
}
