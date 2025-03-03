return {
  {
    "AlphaTechnolog/pywal.nvim",
    name = "pywal",
    priority = 1000, -- Load this before other colorschemes
    config = function()
      require("pywal").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "pywal",
    },
  },
}
