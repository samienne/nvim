return {
    "rmagatti/auto-session",
    enabled = false,
    config = function()
        require("auto-session").setup({
        })

        vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
            noremap = true,
        })
    end
}
