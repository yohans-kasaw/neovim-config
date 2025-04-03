local gitsigns = require("gitsigns")

vim.keymap.set("n", "<A-Down>", function()
	gitsigns.nav_hunk("next")
end, { desc = "Next Hunk" })
vim.keymap.set("n", "<A-Up>", function()
	gitsigns.nav_hunk("prev")
end, { desc = "Next Hunk" })

vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>hm", function() gitsigns.change_base("main", true) end, { desc = "change the diff base to main" })
vim.keymap.set("n", "<leader>hM", function() gitsigns.reset_base(true) end, { desc = "reset the diff base" })

vim.keymap.set("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage Hunk" })

vim.keymap.set("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset Hunk" })

vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk Inline" })
vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

vim.keymap.set("n", "<leader>hb", function()
	gitsigns.blame_line({ full = true })
end, { desc = "Blame Line" })

vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff This" })

vim.keymap.set("n", "<leader>hD", function()
	gitsigns.diffthis("~")
end, { desc = "Diff This Unstaged" })

vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, { desc = "Setqflist" })

vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

-- Text object
vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select Hunk" })

vim.keymap.set("n", "<leader>bl", function()
	Snacks.git.blame_line({
		width = 0.6,
		height = 0.6,
		border = "rounded",
		title = " Git Blame ",
		count = 6,
	})
end, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })

vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })

vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })
