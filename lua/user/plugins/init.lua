local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    require("user.plugins.ui"),
    require("user.plugins.editor"),
    require("user.plugins.lsp"),
    require("user.plugins.tools"),
    require("user.plugins.treesitter"),
    require("user.plugins.motion"),
    require("user.plugins.git"),
    require("user.plugins.AI_tools"),
    require("user.plugins.telescope_and_snacks"),
}

local flattened_plugins = {}
for _, plugin_group in ipairs(plugins) do
    for _, plugin in ipairs(plugin_group) do
        table.insert(flattened_plugins, plugin)
    end
end

require("lazy").setup(flattened_plugins)
