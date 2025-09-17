return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "folke/snacks.nvim",
  },
  keys = {
    { "<leader>ng", mode = { "n" }, function() require("neogit").open() end, desc = "Open NeoGit" },
  },
}
