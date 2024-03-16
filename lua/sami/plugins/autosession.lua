return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
        })

        vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
            noremap = true,
        })
    end
}
--[[
return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
        local possession = require("nvim-possession")
        vim.keymap.set("n", "<leader>sl", function()
            possession.list()
        end)
        vim.keymap.set("n", "<c-s>", function()
            possession.list()
        end)
        vim.keymap.set("n", "<leader>sn", function()
            possession.new()
        end)
        vim.keymap.set("n", "<leader>su", function()
            possession.update()
        end)
        vim.keymap.set("n", "<leader>sd", function()
            possession.delete()
        end)
    end,
}
--]]
