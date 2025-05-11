return {
	plugins = {
		{
			"olimorris/codecompanion.nvim",
			opts = {},
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
			},

			config = function()
				require("codecompanion").setup({
					strategies = {
						chat = {
							adapter = "openrouter",
						},
						inline = {
							adapter = "openrouter",
						},
					},
					adapters = {
						openrouter = function()
							return require("codecompanion.adapters").extend("openai_compatible", {
								env = {
									url = "https://openrouter.ai/api",
									api_key = "OPENROUTER_API_KEY",
									chat_url = "/v1/chat/completions",
								},
								schema = {
									model = {
										default = 'google/gemini-2.0-flash-001',
									},
								},
							})
						end,
					},
				})
			end,
		},
	},
	keys = function() end,
}
