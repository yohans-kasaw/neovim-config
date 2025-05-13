vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

vim.opt.showtabline = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.swapfile = false
vim.o.hidden = true
vim.o.showbreak = "↳⋅"

vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.copyindent = true

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.number = true
vim.opt.fillchars = { eob = " " }

vim.opt.signcolumn = "yes"
vim.g.airline_theme = "oceanicnext"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.g.airline_theme = "oceanicnext"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.smartcase = true

vim.opt.relativenumber = true
vim.opt.scrolloff = 4

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

local function enable_spell()
	vim.opt_local.spell = true
	vim.opt_local.spelllang = { "en_us" } -- Using table for multiple languages
end

vim.o.undofile = true

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
	desc = "Conditional spell checking activation",
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if vim.tbl_contains({ "markdown", "text" }, ft) then
			enable_spell()
		end
	end,
})

-- fzf
vim.g.fzf_buffers_jump = true
vim.g.fzf_layout = { window = { width = 0.8, height = 0.4, yoffset = 0.2 } }
vim.cmd([[let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi']])

-- neovide
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_cursor_animation_length = 0

vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_confirm_quit = true
