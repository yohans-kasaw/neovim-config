return {
	plugins = {},
	keys = function()
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
