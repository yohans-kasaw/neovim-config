return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "echasnovski/mini.pick",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "ibhagwan/fzf-lua",
            "nvim-tree/nvim-web-devicons",
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
        config = function()
            local opts = {
                provider = "openrouter",
                vendors = {
                    openrouter = {
                        __inherited_from = 'openai',
                        endpoint = 'https://openrouter.ai/api/v1',
                        api_key_name = 'OPENROUTER_API_KEY',
                        model = "anthropic/claude-3.5-sonnet:beta",
                    },
                },
            }
            require("avante").setup(opts)
        end,
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<A-Tab>",
                    clear_suggestion = "<A-c>",
                    accept_word = "<A-n>",
                },
                ignore_filetypes = {
                    "TelescopePrompt",
                    "NvimTree",
                    "neo-tree",
                    "notify",
                    "quickfix",
                    "prompt",
                    "text",
                    "markdown",
                    "md",
                },
                disable_inline_completion = false,
                disable_keymaps = false,
            })
        end,
    },
}
