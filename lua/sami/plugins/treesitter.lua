return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                additional_vim_regex_highlighting = false,
                -- enable indentation
                indent = { enable = false },
                -- ensure these language parsers are installed
                ensure_installed = {
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "cpp",
                    "gitignore",
                },
            })
        end,
    },
}
