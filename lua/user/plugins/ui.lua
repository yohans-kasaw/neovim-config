return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            top_down = false,
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    { "nvim-tree/nvim-tree.lua" },
    { "folke/zen-mode.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                tabline = {
                    lualine_a = { "buffers" },
                },
            })
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup({
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                },
            })
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup()
        end,
    },
}

