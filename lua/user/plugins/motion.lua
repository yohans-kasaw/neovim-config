return {
    { "aaronik/treewalker.nvim",
      opts = {
        highlight = true,
        highlight_duration = 250,
        highlight_group = 'CursorLine',
      }
    },
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
