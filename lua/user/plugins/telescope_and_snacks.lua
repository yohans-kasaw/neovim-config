return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({})
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
                    { section = "projects", title="projects", icon="", indent=2, padding=1 },
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
                    }
                },
            },
            notify = { enabled = true},
        },
    },
}
