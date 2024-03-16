return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    opts = {
        autosave = true,
        autoswitch = {
            enable = true
        },
    },
    keys = function()
        local possession = require("nvim-possession")

        return {
            { "<leader>sl", function() possession.list() end,   "n", "Select session" },
            { "<c-s>",      function() possession.list() end,   "n", "Select session" },
            { "<leader>sn", function() possession.new() end,    "n", "New session" },
            { "<leader>su", function() possession.update() end, "n", "Update session" },
            { "<leader>sd", function() possession.delete() end, "n", "Delete session" },
        }
    end
}
