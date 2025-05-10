return {
	plugins = {
		{
			dir = "~/projects/LevelUp.nvim",
			config = function()
				require("LevelUp").setup({})
			end,
		},
	},
	keys = function()
		local keymaps = require("LevelUp")
		keymaps.tracked_keymap({ "n", "x" }, "ap", "ap")
		keymaps.tracked_keymap({ "n", "x" }, "dap", "dap")
	end,
}
