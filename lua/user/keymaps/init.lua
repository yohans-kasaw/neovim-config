vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

map("n", "gl", "<cmd>lua show_diagnostics()<CR>", { noremap = true, silent = true })

-- map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>o", ":w<CR>", { noremap = true, silent = true })
map("n", "<Tab>", ":lua  RunCodeOnFiletype()<CR>", { noremap = true, silent = true })

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-v>", ":vsplit<CR>", opts)

map("n", "tn", "<cmd>bnext<CR>", opts)
map("n", "th", "<cmd>bprev<CR>", opts)
map("n", "td", "<cmd>bd<CR>", opts)
map("n", "ta", [[:lua CloseOtherBuffers()<CR>]], { noremap = true, silent = true })

-- map("n", "<leader>t", "<cmd>Telescope<CR>", opts) -- Direct Telescope command
-- map("n", "<leader>u", "<cmd>Telescope find_files<CR>", opts) -- Find files
-- map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts) -- Live grep
-- map("n", "<leader>a", "<cmd>Telescope oldfiles<CR>", opts) -- Recently opened files
-- map("n", "<leader>r", "<cmd>Telescope repo cached_list<CR>", opts) -- open repo list
-- map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", opts) -- Keymaps
-- map("n", "<leader>r", [[:lua  Telescop_repos()<CR>]], opts)
--
-- map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)
-- map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)
-- map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
-- map("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
-- map("n", "<leader>la", "<cmd>Telescope lsp_code_actions<CR>", opts)
-- map("n", "<leader>lD", "<cmd>Telescope diagnostics<CR>", opts)
--
-- this is for hlslens
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>noh<CR>", opts)

function Telescop_repos()
	require("telescope").extensions.repo.cached_list({
		file_ignore_patterns = {
			"^" .. vim.env.HOME .. "/%.cache/",
			"^" .. vim.env.HOME .. "/%.cargo/",
			"^" .. vim.env.HOME .. "/.local/",
		},
	})
end

function CloseOtherBuffers()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end

local function get_run_command(filetype)
	if filetype == "typescript" then
		return ":!echo & ts-node %"
	elseif filetype == "javascript" then
		return ":!echo & cat test | node %"
	elseif filetype == "python" then
		return ":!echo & cat test | python %"
	elseif filetype == "go" then
		return ":! echo && cat test | go run ."
	elseif filetype == "lua" then
		return ":!echo & lua %"
	elseif filetype == "cs" then
		return ":!echo & dotnet run"
	elseif filetype == "rust" then
		return ":! echo && cat test | cargo run --quiet"
	elseif filetype == "dart" then
		return ":! echo && cat test | dart %"
	-- http file
	elseif filetype == "http" then  
	    return ":Rest run"
	else
		return ""
	end
end

function RunCodeOnFiletype()
	local filetype = vim.bo.filetype
	local cmd = get_run_command(filetype)
	vim.api.nvim_command(cmd)
end

function show_diagnostics()
	vim.diagnostic.open_float(nil, {})
end

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File Explorer" })

-- find
vim.keymap.set("n", "<leader>ub", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>uc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>uf", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ug", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>up", function()
	Snacks.picker.projects()
end, { desc = "Projects" })
vim.keymap.set("n", "<leader>ur", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

-- git
vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- Grep
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function()
	Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

-- LSP
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
vim.keymap.set("n", "<leader>sS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

-- Other
vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>n", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })
vim.keymap.set({ "n", "v" }, "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", "<c-/>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<c-_>", function()
	Snacks.terminal()
end, { desc = "which_key_ignore" })
vim.keymap.set({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

vim.keymap.set("n", "<leader>bl", function()
	Snacks.git.blame_line({
		width = 0.6,
		height = 0.6,
		border = "rounded",
		title = " Git Blame ",
		count = 6,
	})
end, { desc = "Git Blame Line" })


vim.keymap.set("n", "<leader>d", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end, { desc = "Toggle Diff View" })
