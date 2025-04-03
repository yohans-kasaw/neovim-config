return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
            require("telescope._extensions.project.actions")
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				sections = {
					{ section = "projects", title = "projects", icon = "", indent = 2, padding = 1 },
					{ section = "session" },
					{ section = "startup" },
				},
			},
			indent = { enabled = true },
			picker = {
				matcher = {
					cwd_bonus = true,
					frecency = true,
					history_bonus = true,
				},
				formatters = {
					file = {
						filename_first = true,
					},
				},
			},
			notify = { enabled = true },
		},
	},
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {}
    },
    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
    }
}
