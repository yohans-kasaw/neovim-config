return {
    { "aaronik/treewalker.nvim"},
    {
        "ggandor/leap.nvim",
        dependencies = {
            { "tpope/vim-repeat" },
        },
        config = function()
            local leap = require("leap")
            leap.opts.safe_labels = {}
            leap.opts.preview_filter = function()
                return false
            end

            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
        end,
    },
}
