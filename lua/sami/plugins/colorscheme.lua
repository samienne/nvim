return {
  {
    "bluz71/vim-nightfly-guicolors",
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
      "EdenEast/nightfox.nvim",
      priority = 1000,
      enabled = false,
      config = function()
          vim.cmd([[colorscheme nightfox]])
      end,
  },
  {
      "elianiva/icy.nvim",
      priority = 1000,
      enabled = true,
      config = function()
          vim.cmd([[colorscheme icy]])
      end,
  },
}
