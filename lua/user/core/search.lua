return {
	plugins = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			opts = {
				bigfile = { enabled = true },
				dashboard = {
					sections = {
						{
							section = "projects",
							title = "projects",
							icon = "",
							indent = 2,
							padding = 1,
						},
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
				scratch = {
					enabled = true,
					ft = function()
						return "markdown"
					end,
					filekey = {
						cwd = true, -- use current working directory
						branch = false, -- use current branch name
						count = true, -- use vim.v.count1
					},
				},
				gitbrowse = {},
			},
		},
		{
			"ibhagwan/fzf-lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {},
		},
	},
	keys = function()
		vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope<CR>", { noremap = true, silent = false })
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>*",
			"<Cmd>Telescope grep_string word_match=-w<CR>",
			{ desc = "Search word under cursor" }
		)

		vim.keymap.set("n", "<leader>f/", require("fzf-lua").grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>f*", require("fzf-lua").grep_cword, { desc = "Search word under cursor" })
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").git_files, { desc = "Git Files" })
		vim.keymap.set("n", "<leader>fs", require("fzf-lua").lsp_finder, { desc = "lsp finder" })
		vim.keymap.set("n", "<leader>fc", require("fzf-lua").commands, { desc = "Commands" })
		vim.keymap.set("n", "<leader>fr", require("fzf-lua").resume, { desc = "resume" })
		vim.keymap.set("n", "<leader>fj", require("fzf-lua").jumps, { desc = "jumps" })

		vim.keymap.set("n", "<leader><space>", function()
			Snacks.picker.smart()
		end, { desc = "Smart Find Files" })

		vim.keymap.set("n", "<leader>/", function()
			Snacks.picker.grep()
		end, { desc = "Grep" })

		vim.keymap.set("n", "<leader>up", function()
			Snacks.picker.projects()
		end, { desc = "Projects" })

		vim.keymap.set("n", "<leader>b", function()
			Snacks.picker.buffers()
		end, { desc = "Keymaps" })

		vim.keymap.set("n", "<leader>.", function()
			Snacks.scratch()
		end, { desc = "Toggle Scratch Buffer" })

		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, { desc = "Goto Definition" })

		vim.keymap.set("n", "gD", function()
			Snacks.picker.lsp_declarations()
		end, { desc = "Goto Declaration" })

		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { nowait = true, desc = "References" })

		vim.keymap.set("n", "gI", function()
			Snacks.picker.lsp_implementations()
		end, { desc = "Goto Implementation" })

		vim.keymap.set("n", "gy", function()
			Snacks.picker.lsp_type_definitions()
		end, { desc = "Goto T[y]pe Definition" })

		vim.keymap.set("n", "<leader>ss", function()
			Snacks.picker.lsp_symbols()
		end, { desc = "LSP Symbols" })

		vim.keymap.set("n", "<leader><space>", function()
			Snacks.picker.smart()
		end, { desc = "Smart Find Files" })

		vim.keymap.set("n", "<leader>/", function()
			Snacks.picker.grep()
		end, { desc = "Grep" })

		vim.keymap.set("n", "<leader>hB", function()
			Snacks.gitbrowse()
		end, { desc = "gitbrowse" })
	end,
}
