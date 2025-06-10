return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    main = "ibl",
    ---@module "ibl",
    ---@type ibl.config,
    opts = {},
    config = function()
        local highlight = {
            "WhiteSpace",
        }

        require("ibl").setup({
            indent = {
                --highlight = highlight,
                --char = ":",
                char = "│",
            },
            whitespace = {
                --highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = {
                enabled = false
            }
        })
    end
}
