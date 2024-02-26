return {
    "kaplanz/retrail.nvim",

    config = function()
        require("retrail").setup {
            -- Highlight group to use for trailing whitespace.
            hlgroup = "Search",
            -- Pattern to match trailing whitespace against. Edit with caution!
            pattern = "\\v((.*%#)@!|%#)\\s+$",
            -- Enabled filetypes.
            filetype = {
                -- Strictly enable only on `include`ed filetypes. When false, only disabled
                -- on an `exclude`ed filetype.
                strict = false,
                -- Included filetype list.
                include = {},
                -- Excluded filetype list. Overrides `include` list.
                exclude = {
                    "",
                    "aerial",
                    "alpha",
                    "checkhealth",
                    "cmp_menu",
                    "diff",
                    "lazy",
                    "lspinfo",
                    "man",
                    "mason",
                    "TelescopePrompt",
                    "toggleterm",
                    "Trouble",
                    "WhichKey",
                },
            },
            trim = {
                -- Auto trim on BufWritePre
                auto = false,
                -- Trailing whitespace as highlighted.
                whitespace = true,
                -- Final blank (i.e. whitespace only) lines.
                blanklines = false,
            }
        }

        vim.cmd(":RetrailEnable")
    end
}
