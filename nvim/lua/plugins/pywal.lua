return {
  -- Add pywal.nvim plugin
  {
    "AlphaTechnolog/pywal.nvim",
    priority = 1000, -- High priority to load before other colorschemes
    config = function()
      require("pywal").setup()
    end,
  },

  -- Override LazyVim colorscheme settings
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "pywal"
    end,
  },
}
